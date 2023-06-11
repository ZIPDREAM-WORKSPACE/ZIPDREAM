package com.kh.zipdream.sell.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.zipdream.admin.model.vo.Report;
import com.kh.zipdream.sell.model.vo.SellDetail;

public interface SellService {
	
	int sellInsert(SellDetail sd, String webPath, String serverFolderPath, List<MultipartFile> imgList) throws Exception;
	
	void selectSellList(Map<String, Object> map, int refUno);	
	
	SellDetail sellDetail(int sellNo);
	
	List<SellDetail> selectSellAllList();

	public int insertReport(Report report);
}
