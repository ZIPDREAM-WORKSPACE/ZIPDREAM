package com.kh.zipdream.sell.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.zipdream.sell.model.dao.SellDao;

@Service
public class SellServiceImpl implements SellService {

	@Autowired
	private SellDao sellDao;
	

}
