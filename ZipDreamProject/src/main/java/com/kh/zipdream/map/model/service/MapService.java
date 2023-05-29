package com.kh.zipdream.map.model.service;

import java.util.List;

public interface MapService {
	
	public int selectBjbCode(String detailAddrClob);
	
	public List selectAddress(String adCode);
}
