package com.bean;

import java.util.List;
import java.util.Map;

public class PageNumInfo {

	private int total;
	private List<Map<String,Object>> list;
	
	public List<Map<String, Object>> getList() {
		return list;
	}
	public void setList(List<Map<String, Object>> list) {
		this.list = list;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
}
