package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.QualityDAO;
import com.itwillbs.domain.QualityDTO;

@Service
public class QualityServiceImpl implements QualityService{
	
	@Inject
	private QualityDAO qualityDAO;

	@Override
	public List<Map<String, Object>> getQualityListMap(QualityDTO qualityDTO) {
		System.out.println("QualityServiceImpl ListMap()");
		
		return qualityDAO.getQualityListMap(qualityDTO);
	}
	
	@Override
	public QualityDTO getQualityWrite(String wo_num) {
		System.out.println("QualityServiceImpl ListMap()");
		
		return qualityDAO.getQualityWrite(wo_num);
	}

}
