package com.itwillbs.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SearchDTO;
import com.itwillbs.service.EmployeeService;



@Controller
public class EmployeeController {
	@Inject
	private EmployeeService employeeService;
	

	 @Resource(name="employeeUploadPath") 
	 private String employeeUploadPath;
	 
	
	@RequestMapping(value = "/main/login", method = RequestMethod.GET)
	public String login() {
		return "main/login";
	}
	
	@RequestMapping(value = "/main/loginPro", method = RequestMethod.POST)
	public String loginPro(EmployeeDTO employeeDTO, HttpSession session) {
		System.out.println("EmployeeController loginPro()");
		
		EmployeeDTO employeeDTO2=employeeService.userCheck(employeeDTO);
		
		if(employeeDTO2 != null) {
			
			session.setAttribute("emp_num", employeeDTO.getEmp_num());
			session.setAttribute("userProfileImagePath", employeeDTO2.getEmp_img());
			session.setAttribute("emp_Kname", employeeDTO2.getEmp_Kname());
			session.setAttribute("dept_num", employeeDTO2.getDept_num());
			System.out.println(employeeDTO2.getEmp_Kname());
			
			return "redirect:/main/main";
		}else {
			return "main/loginErrorMsg";
		}
	}
	
	@RequestMapping(value = "/main/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");
		session.invalidate();
		return "redirect:/main/main";
	}
	
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main() {
		return "main/main";
	}
	
	
	@RequestMapping(value = "/employee/empManage", method = RequestMethod.GET)
	public String empManage(Model model) {
		System.out.println("MemberController empManage");
		
			
		return "/employee/empManage";
	}
	
	@RequestMapping(value = "/employee/employeeList", method = RequestMethod.GET)
	public String employeeList(Model model, HttpServletRequest request) {
		System.out.println("MemberController employeeList");
		
		String search_option = request.getParameter("search_option");
		String keyword = request.getParameter("keyword");
		String search_check = request.getParameter("check");
		SearchDTO searchDTO = new SearchDTO();
		searchDTO.setKeyword(keyword);
		searchDTO.setSearch_option(search_option);
		searchDTO.setSearch_check(search_check);
		
		List<Map<String, Object>> employeeListMap = employeeService.getEmployeeListMap(searchDTO);
		model.addAttribute("employeeListMap",employeeListMap);
		model.addAttribute("search_option",search_option);
		model.addAttribute("keyword",keyword);
		
		return "/employee/empManage";
	}
	
	@RequestMapping(value = "/employee/insertEmployee", method = RequestMethod.GET)
	public String insertEmployee() {
		System.out.println("MemberController insertEmployee");
		
		return "employee/insertEmployee";
	}
	
	@RequestMapping(value = "/employee/insertEmployeePro", method = RequestMethod.POST)
	public String inertEmployeePro(HttpServletRequest request, MultipartFile file)throws Exception {
		System.out.println("MemberController isnertEmployeePro");
		
		System.out.println(request.getParameter("dept_num"));
		
		  EmployeeDTO employeeDTO = new EmployeeDTO();
		  employeeDTO.setDept_num(request.getParameter("dept_num"));
		  employeeDTO.setEmp_Kname(request.getParameter("emp_Kname"));
		  employeeDTO.setEmp_Ename(request.getParameter("emp_Ename"));
		  employeeDTO.setEmp_birth(request.getParameter("emp_birth"));
		  employeeDTO.setEmp_gender(request.getParameter("emp_gender"));
		  employeeDTO.setEmp_tel(Integer.parseInt(request.getParameter("emp_tel")));
		  employeeDTO.setEmp_phone(Integer.parseInt(request.getParameter("emp_phone")));
		  employeeDTO.setEmp_email(request.getParameter("emp_email"));
		  employeeDTO.setEmp_addr(request.getParameter("emp_addr"));
		  employeeDTO.setEmp_addr2(request.getParameter("emp_addr2"));
		  employeeDTO.setEmp_classification(Integer.parseInt(request.getParameter("emp_classification")));
		  employeeDTO.setDept_position(request.getParameter("dept_position"));
		  employeeDTO.setDept_duty(request.getParameter("dept_duty"));
		  employeeDTO.setEmp_status("재직");
		  
		  if(!file.isEmpty()) {
		  UUID uuid=UUID.randomUUID(); 
		  String filename =uuid.toString()+"_"+file.getOriginalFilename();
		  FileCopyUtils.copy(file.getBytes(), new File(employeeUploadPath,filename));
		 
		  employeeDTO.setEmp_img(filename);} else employeeDTO.setEmp_img("emp_default.png");
		  
		  employeeService.insertEmployee(employeeDTO);
		
		return "/employee/empManage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/employee/employeeDetail", method = RequestMethod.GET)
	public List<Map<String, Object>> employeeDetail(HttpServletRequest request,Model model,MultipartFile file)throws Exception {
		System.out.println("MemberController employeeDetail");
		
		int emp_num = Integer.parseInt(request.getParameter("emp_num"));
		
		List<Map<String, Object>> employeeDetail = employeeService.getEmployeeDetail(emp_num);
		model.addAttribute("employeeDetail",employeeDetail);
			
		return employeeDetail;
	}
	
	@RequestMapping(value = "/employee/updateEmployee", method = RequestMethod.GET)
	public String updateEmployee(HttpServletRequest request,Model model,MultipartFile file)throws Exception {
		System.out.println("MemberController updateEmployee");
		
		int emp_num = Integer.parseInt(request.getParameter("emp_num"));
		
		List<Map<String, Object>> employeeDetail = employeeService.getEmployeeDetail(emp_num);
		model.addAttribute("employeeDetail",employeeDetail);
			
		
		return "employee/updateEmployee";
	}
	
	@ResponseBody
	@RequestMapping(value = "/employee/absenceEmployee", method = RequestMethod.GET)
	public String absenceEmployee(HttpServletRequest request,Model model,MultipartFile file)throws Exception {
		System.out.println("MemberController absenceEmployee");
		
		int emp_num = Integer.parseInt(request.getParameter("emp_num"));
		System.out.println(emp_num);
		
		employeeService.absenceEmployee(emp_num);

		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value = "/employee/rehabilitationEmployee", method = RequestMethod.GET)
	public String rehabilitationEmployee(HttpServletRequest request,Model model,MultipartFile file)throws Exception {
		System.out.println("MemberController rehabilitationEmployee");
		
		int emp_num = Integer.parseInt(request.getParameter("emp_num"));
		System.out.println(emp_num);
		
		employeeService.rehabilitationEmployee(emp_num);

		return "1";
	}
	
	@ResponseBody
	@RequestMapping(value = "/employee/leaveEmployee", method = RequestMethod.GET)
	public String leaveEmployee(HttpServletRequest request,Model model,MultipartFile file)throws Exception {
		System.out.println("MemberController leaveEmployee");
		
		int emp_num = Integer.parseInt(request.getParameter("emp_num"));
		System.out.println(emp_num);
		
		employeeService.leaveEmployee(emp_num);

		return "1";
	}
	
	
	@RequestMapping(value = "/employee/updateEmployeePro", method = RequestMethod.POST)
	public String updateEmployeePro(HttpServletRequest request, MultipartFile file) throws Exception{
		System.out.println("EmployeeController updateEmployeePro");
		
		int emp_num = Integer.parseInt(request.getParameter("emp_num"));
		
		  EmployeeDTO employeeDTO = new EmployeeDTO();
		  employeeDTO.setDept_num(request.getParameter("dept_num"));
		  employeeDTO.setEmp_Kname(request.getParameter("emp_Kname"));
		  employeeDTO.setEmp_Ename(request.getParameter("emp_Ename"));
		  employeeDTO.setEmp_tel(Integer.parseInt(request.getParameter("emp_tel")));
		  employeeDTO.setEmp_phone(Integer.parseInt(request.getParameter("emp_phone")));
		  employeeDTO.setEmp_email(request.getParameter("emp_email"));
		  employeeDTO.setEmp_addr(request.getParameter("emp_addr"));
		  employeeDTO.setEmp_addr2(request.getParameter("emp_addr2"));
		  employeeDTO.setEmp_classification(Integer.parseInt(request.getParameter("emp_classification")));
		  employeeDTO.setDept_position(request.getParameter("dept_position"));
		  employeeDTO.setDept_duty(request.getParameter("dept_duty"));
		  employeeDTO.setEmp_num(emp_num);
		  
			if(file.isEmpty()) {
				employeeDTO.setEmp_img(request.getParameter("oldfile"));
			} else {
				UUID uuid=UUID.randomUUID();
				String filename=uuid.toString()+"_"+file.getOriginalFilename();
				FileCopyUtils.copy(file.getBytes(), new File(employeeUploadPath,filename));
				employeeDTO.setEmp_img(filename);
			}
			
			employeeService.updateEmployee(employeeDTO);
			
		return "employee/empMsg";
	}
	
	@RequestMapping(value = "/employee/yellowPage", method = RequestMethod.GET)
	public String yellowPage(HttpServletRequest request, Model model) {
		System.out.println("EmployeeController yellowPage");

		
		String search_option = request.getParameter("search_option");
		String keyword = request.getParameter("keyword");
		
		int pageSize=14;
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {pageNum="1";}
		
		System.out.println("pageNum"+pageNum);
		
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setKeyword(keyword);
		pageDTO.setSearch_option(search_option);
		
		List<Map<String, Object>> yellowPage = employeeService.yellowPage(pageDTO);
		model.addAttribute("yellowPage",yellowPage);
		model.addAttribute("search_option",search_option);
		model.addAttribute("keyword",keyword);
		model.addAttribute("pageDTO",pageDTO);
		
		int count = employeeService.yellowPageCount(pageDTO);
		
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		return "employee/yellowPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/employee/yellowPageDetail", method = RequestMethod.GET)
	public List<Map<String, Object>> yellowPageDetail(HttpServletRequest request,Model model,MultipartFile file)throws Exception {
		System.out.println("MemberController yellowPageDetail");
		
		int emp_num = Integer.parseInt(request.getParameter("emp_num"));
		System.out.println(emp_num);
		List<Map<String, Object>> employeeDetail = employeeService.getEmployeeDetail(emp_num);
		model.addAttribute("employeeDetail",employeeDetail);
			
		return employeeDetail;
	}
	
}
