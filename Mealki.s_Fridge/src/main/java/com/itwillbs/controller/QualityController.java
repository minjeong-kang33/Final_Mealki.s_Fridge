package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.QualityDTO;
import com.itwillbs.service.QualityService;

@Controller
public class QualityController {
	
	@Inject
	private QualityService qualityService;
	
	@RequestMapping(value = "/mps/quality/list", method = RequestMethod.GET)
	public String listmap(QualityDTO qualityDTO, Model model){

	List<Map<String, Object>> qualityListMap=qualityService.getQualityListMap(qualityDTO);
	List<Map<String, Object>> qualityFailList=qualityService.getQualityFailList(qualityDTO);
	
	model.addAttribute("qualityListMap", qualityListMap);
	model.addAttribute("qualityFailList", qualityFailList);
	
	
	return "mps/quality/listForm";
	}
	
	@RequestMapping(value = "/quality/writeForm", method = RequestMethod.GET)
	public String qualityWrite(HttpServletRequest request, HttpSession session, Model model) {
		System.out.println("QualityController writeForm()");
		
		int emp_num=(int)session.getAttribute("emp_num");
		System.out.println("세션 id : " + emp_num);
		
		String wo_num=request.getParameter("wo_num");
		
		QualityDTO qualitySession=qualityService.getemp_Knamesession(emp_num);
		QualityDTO qualityDTO=qualityService.getQualityWrite(wo_num);
		QualityDTO qualityCode=qualityService.getQualityCode(wo_num);
		
		model.addAttribute("qualityDTO", qualityDTO);
		model.addAttribute("qualitySession", qualitySession);
		model.addAttribute("qualityCode", qualityCode);
		
		System.out.println(qualityDTO);
		return "mps/quality/writeForm";
	}
	
	@RequestMapping(value = "/quality/writePro", method = RequestMethod.POST)
	public String insertQuality(QualityDTO qualityDTO) {
		System.out.println("QualityController writePro()");
		
		qualityService.insertQuality(qualityDTO);
		return "mps/quality/writeclose";
	}
	
	@RequestMapping(value = "/quality/qcUpdate", method = RequestMethod.POST)
	public String updateQuality(QualityDTO qualityDTO) {
		System.out.println("QualityController updatePro()");
		
		qualityService.updateQuality(qualityDTO);
		return "mps/quality/writeclose";
	}
	
	@RequestMapping(value = "/quality/failWrite", method = RequestMethod.GET)
	public String qualityFailWrite(HttpServletRequest request, HttpSession session, Model model) {
		System.out.println("QualityController FailWrite()");
		
		int emp_num=(int)session.getAttribute("emp_num");
		System.out.println("세션 id : " + emp_num);
		
		String wo_num=request.getParameter("wo_num");
		
		QualityDTO qualitySession=qualityService.getemp_Knamesession(emp_num);
		QualityDTO qualityDTO=qualityService.getFailWrite(wo_num);
		
		model.addAttribute("qualityDTO", qualityDTO);
		model.addAttribute("qualitySession", qualitySession);
		
		System.out.println(qualityDTO);
		return "mps/quality/failWrite";
	}
	
	@RequestMapping(value = "/quality/failWritePro", method = RequestMethod.POST)
	public String insertFail(QualityDTO qualityDTO) {
		System.out.println("QualityController FailWritePro()");
		
		qualityService.insertFail(qualityDTO);
		return "mps/quality/writeclose";
	}
	
	@RequestMapping(value = "/quality/failUpdate", method = RequestMethod.POST)
	public String updateFail(QualityDTO qualityDTO) {
		System.out.println("QualityController updatePro()");
		
		qualityService.updateFail(qualityDTO);
		return "mps/quality/writeclose";
	}
	
}
