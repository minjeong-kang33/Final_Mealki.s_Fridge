package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.QualityDTO;
public interface QualityDAO {
	public List<Map<String, Object>> getQualityListMap(QualityDTO qualityDTO);
	
	public QualityDTO getQualityWrite(String wo_num);
	
	public QualityDTO getemp_Knamesession(int emp_num);
	
	public QualityDTO getQualityCode(String wo_num);
}
