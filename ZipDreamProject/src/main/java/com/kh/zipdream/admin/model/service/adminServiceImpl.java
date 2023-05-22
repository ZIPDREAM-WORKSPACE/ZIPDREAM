package com.kh.zipdream.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.admin.model.dao.adminDao;

@Service
public class adminServiceImpl implements adminService{

	@Autowired
	private adminDao dao;
	
	public int countUser() {
		return dao.countUser(); 
	}
	
	public int countLicenseUser() {
		return dao.countLicenseUser();
	}
	
	public int countObject() {
		return dao.countObject();
	}
	
	public int countReport() {
		return dao.countReport();
	}
	
	public int countEvent() {
		return dao.countEvent();
	}
}
