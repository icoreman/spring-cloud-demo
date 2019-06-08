# spring-cloud-demo
the demo of Spring Cloud。

version： Spring Cloud Dalston.SR1, Spring Boot 1.5.9.RELEASE。

### 如何运行：  
1）克隆项目本地；  
2) 运行parent src目录下的 dbsql.sql。  
3) 需要修改本地 host 文件，形成映射。  
4) 运行 `mvn install`。  
5) 按照以下对应模块启动项目。  

host 添加内容（parent/src 下也有）：
```
127.0.0.1	eureka9001.com
127.0.0.1	eureka9002.com
127.0.0.1	eureka9003.com
127.0.0.1	gateway-9600.com
127.0.0.1	config-3344.com
127.0.0.1	config-client.com
```

因为 Eureka server 要有 hostname，在单机运行如果不做映射，大家都是 localhost 就不好区分了。
``` YAMl
eureka: 
  instance:
    hostname: eureka9001.com #eureka服务端的实例名称,由于不能都一样，所以，要修改下 host 进行下映射
```

### [Eureka](https://www.jianshu.com/p/f1257fde4dcb)
**单机版**

单机版，只需要运行 `spring-cloud-eureka-server-9001`服务注册中心、`spring-cloud-provider-dept-8001`提供者、`spring-cloud-consumer-dept-8100`消费者，将这三个 application.yml 配置文件中的 `defaultZone` 改为单机版本：`defaultZone: http://localhost:9001/eureka`。

``` YAML
eureka:
  client: #客户端注册进eureka服务列表内
    service-url: 
      #defaultZone: http://localhost:9001/eureka
```

浏览器访问 `http://localhost:8100/consumer/dept/get/1`，出现 `{"deptNo":1,"deptName":"人事部","dbSource":"clouddb1"}`，即算搭建成功。

**集群版本**

分别启动 `spring-cloud-eureka-server-9001`、`spring-cloud-eureka-server-9002`、`spring-cloud-eureka-server-9003`，为 eureka-server 集群，记得检查 application.yml 配置文件。

然后启动 `spring-cloud-provider-dept-8001`、`spring-cloud-provider-dept-8002`、`spring-cloud-provider-dept-8003`,为提供者集群，记得检查 application.yml 配置文件。

最后启动 `spring-cloud-consumer-dept-8100`，记得检查 application.yml 配置文件。

``` YAML
eureka:
  client: #客户端注册进eureka服务列表内
    service-url: 
      #defaultZone: http://localhost:9001/eureka
      defaultZone: http://localhost:9001/eureka/,http://localhost:9002/eureka/,http://localhost:9003/eureka/ 
```
浏览器访问 `http://localhost:8100/consumer/dept/get/1`，出现 `{"deptNo":1,"deptName":"人事部","dbSource":"clouddb1"}`，即算搭建成功，
## [Ribbin](https://www.jianshu.com/p/f4f2ec6ad81d)

Ribbin 是一个客户端负载均衡器，所以就放在 `spring-cloud-consumer-dept-8100` 与 `spring-cloud-consumer-dept-feign` 中。
向注册中心获取可用和总的服务数，根据一定的规则选择可用的服务。默认规则为 ZoneAvoidanceRule，测起来跟轮询一样呢？自定义规则要注意，不要将规则放到 `@ComponentScan` 的扫描路径中，以避免被所有 @RibbonClients共享。

## [Feign](https://springcloud.cc/spring-cloud-dalston.html#spring-cloud-feign)

Feign 是一个声明式的Web服务客户端，有了它我们又可以面向接口编程，而不用去使用 RestTemplate。

在集群基础上，运行 `spring-cloud-consumer-dept-feign`。

## [Hystrix](https://www.jianshu.com/p/ce39f620425c)

断路器，在提供方发生错误时做服务降级、实现服务熔断。

运行 spring-cloud-provider-dept-hystrix-8001，在消费端访问 `http://localhost:8100/consumer/dept/get/6`，返回结果`{"deptNo":6,"deptName":"该ID：6没有没有对应的信息,null--@HystrixCommand","dbSource":"no this database in MySQL"}`，即配置成功。

也分两种，这一种是把降级逻辑放到了提供方，但是，提供方故障挂掉，就没用了。所以要将熔断逻辑放到消费方。

查看 `spring-cloud-dept-api` 工程，实现了 `FallbackFactory`，利用 AOP 面向切面编程。

## [Zuul](https://www.jianshu.com/p/d06771bc719c)

Zuul是 Netflix 的基于JVM的路由器和服务器端负载均衡器。

运行集群与 `spring-cloud-zuul-geteway-9600`, Zuul 也是需要向服务中心注册自己的。启动后，http://gateway-9600.com 就成了应用的入口：

``` YAML
zuul: 
  #ignored-services: microservicecloud-dept
  prefix: /xuxx
  ignored-services: "*"
  routes: 
    mydept.serviceId: microservicecloud-dept
    mydept.path: /mydept/**
```

根据规则，前缀为 /xuxx,路径为 /mudept 的所有请求将于映射到 `microservicecloud-dept` 服务。集群启动后，访问 `http://gateway-9600.com:9600/xuxx/mydept/dept/get/2`,能返回正常数据，说明搭建成功。

## [Config 配置中心](https://www.jianshu.com/p/e00922484abf)

Spring Cloud Config为分布式系统中的外部配置提供服务器和客户端支持。方便部署与运维。  

先把服务全部停掉。  

[配置中心地址](https://github.com/icoreman/spring-cloud-config-demo1)。  

分别运行 `spring-cloud-config-3344` 配置中心服务端、`spring-cloud-config-eureka-server`通过配置启动的 Eureka 注册中心、`spring-cloud-config-provider-dept` 通过配置启动的提供者。  

访问 `http://localhost:8001/dept/get/1` 能正常获取数据，说明服务配置成功。


