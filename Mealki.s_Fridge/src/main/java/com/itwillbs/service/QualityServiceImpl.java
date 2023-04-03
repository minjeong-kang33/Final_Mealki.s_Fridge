package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.QualityDAO;
import com.itwillbs.domain.ProductionDTO;
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
	
	@Override
	public QualityDTO getemp_Knamesession(int emp_num) {
		System.out.println("QualityServiceImpl getemp_Knamesession()");
		
		return qualityDAO.getemp_Knamesession(emp_num);
	}

	@Override
	public QualityDTO getQualityCode(String wo_num) {
		
		return qualityDAO.getQualityCode(wo_num);
	}

	@Override
	public void insertQuality(QualityDTO qualityDTO) {
		
		qualityDAO.insertQuality(qualityDTO);
	}

	
	@Override
	public void updateQuality(QualityDTO qualityDTO) {
		
		qualityDAO.updateQuality(qualityDTO);
		
	}
	
	@Override
	public List<Map<String, Object>> getQualityFailList(QualityDTO qualityDTO) {
		System.out.println("QualityServiceImpl FailListMap()");
		
		return qualityDAO.getQualityFailList(qualityDTO);
	}

	@Override
	public QualityDTO getFailWrite(String wo_num) {
		
		return qualityDAO.getFailWrite(wo_num);
	}

	@Override
	public void insertFail(QualityDTO qualityDTO) {
		qualityDAO.insertFail(qualityDTO);
		
	}


	@Override
	public void updateFail(QualityDTO qualityDTO) {
		qualityDAO.updateFail(qualityDTO);
	}

}
