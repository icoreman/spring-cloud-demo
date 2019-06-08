CREATE DATABASE /*!32312 IF NOT EXISTS*/`clouddb1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `clouddb1`;

CREATE TABLE `dept` (
  `dept_no` bigint(20) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) DEFAULT NULL,
  `db_source` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dept_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


INSERT INTO dept (id,dept_name,db_source) VALUES (1,'人事部',DATABASE());
INSERT INTO dept (id,dept_name,db_source) VALUES (2,'开发部',DATABASE());
INSERT INTO dept (id,dept_name,db_source) VALUES (3,'财务部',DATABASE());
INSERT INTO dept (id,dept_name,db_source) VALUES (4,'市场部',DATABASE());
INSERT INTO dept (id,dept_name,db_source) VALUES (5,'运维部',DATABASE());


CREATE DATABASE /*!32312 IF NOT EXISTS*/`clouddb2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `clouddb2`;

CREATE TABLE `dept` (
  `dept_no` bigint(20) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) DEFAULT NULL,
  `db_source` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dept_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


INSERT INTO dept (id,dept_name,db_source) VALUES (1,'人事部',DATABASE());
INSERT INTO dept (id,dept_name,db_source) VALUES (2,'开发部',DATABASE());
INSERT INTO dept (id,dept_name,db_source) VALUES (3,'财务部',DATABASE());
INSERT INTO dept (id,dept_name,db_source) VALUES (4,'市场部',DATABASE());
INSERT INTO dept (id,dept_name,db_source) VALUES (5,'运维部',DATABASE());


CREATE DATABASE /*!32312 IF NOT EXISTS*/`clouddb3` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `clouddb3`;

CREATE TABLE `dept` (
  `dept_no` bigint(20) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(100) DEFAULT NULL,
  `db_source` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dept_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


INSERT INTO dept (id,dept_name,db_source) VALUES (1,'人事部',DATABASE());
INSERT INTO dept (id,dept_name,db_source) VALUES (2,'开发部',DATABASE());
INSERT INTO dept (id,dept_name,db_source) VALUES (3,'财务部',DATABASE());
INSERT INTO dept (id,dept_name,db_source) VALUES (4,'市场部',DATABASE());
INSERT INTO dept (id,dept_name,db_source) VALUES (5,'运维部',DATABASE());
