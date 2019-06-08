package com.xuxx.dept.service;

import java.util.List;

import com.xuxx.entity.Dept;

public interface DeptService {
	public boolean add(Dept dept);

	public Dept get(Long id);

	public List<Dept> list();
}
