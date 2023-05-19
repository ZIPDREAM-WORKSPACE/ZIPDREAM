package com.kh.zipdream.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.model.dao.Dao;

@Service
public class service {
		
		@Autowired
		private Dao dao;
		
		public String select() {
			return dao.select();
		}
}
