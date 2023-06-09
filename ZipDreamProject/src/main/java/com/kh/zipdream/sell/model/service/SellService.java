package com.kh.zipdream.sell.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.zipdream.admin.model.vo.Report;
import com.kh.zipdream.sell.model.vo.Counsle;
import com.kh.zipdream.sell.model.vo.SellDetail;
import com.kh.zipdream.sell.model.vo.SellDetailApi;

public interface SellService {
	
	int sellInsert(SellDetail sd, String webPath, String serverFolderPath, List<MultipartFile> imgList) throws Exception;
	
	void selectSellList(Map<String, Object> map, int refUno);	
	
	SellDetail sellDetail(int sellNo);
	
	List<SellDetail> selectSellAllList();
	
	SellDetailApi detailApiSecond(Map<String, String> map);

	public int insertReport(Report report);
	
	public int insertCounsle(Counsle counsle);
	
	public int insertUserSelect(Map<String,Integer> map);
	
	public int deleteUserSelect(Map<String,Integer> map);
	

	void selectCounsel(Map<String, Object> map, int refTno);
	
	int deleteSell(Map<String, Object> map);

	public List<SellDetail> selectSellList2(int sellNo);
	
	public int countUserSelect(Map<String,Integer>map);

}
