package mvcapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mvcapp.dao.CompanyDao;
import mvcapp.model.Company;

@Controller
public class CompanyController {
	
	@Autowired
	private CompanyDao companyDao;
	
	@RequestMapping("/")
	public String home(Model model)
	{
		List<Company> company= companyDao.getAllCompany();
		model.addAttribute("companies", company);
		return "index";
	}
	
	//shows add company form 
	@RequestMapping("/add-company")
	public String addCompany(Model model)
	{
		model.addAttribute("title", "Add Company");
		return "add-company";
	}
	
	//handle add company form request
	@RequestMapping(value="/submit-company",  method=RequestMethod.POST)
	public String handleCompany(@ModelAttribute Company company, HttpServletRequest request)
	{
		companyDao.createCompany(company);
//		RedirectView redirectView = new RedirectView();
//		redirectView.setUrl(request.getContextPath()+ "/");
		return "redirect:/";
	}
	
	//delete handle request
	@RequestMapping("/delete/{companyId}")
	public String deleteCompany(@PathVariable("companyId") int id, HttpServletRequest request)
	{
		companyDao.deleteCompany(id);
//		RedirectView redirectView = new RedirectView();
//		redirectView.setUrl(request.getContextPath()+ "/");
		return "redirect:/";
	}
	
	//show update company form
	@RequestMapping("/update/{companyId}")
	public String updateCompanyForm(@PathVariable("companyId") int id, Model model)
	{
		Company company = this.companyDao.getSingleCompany(id);
		model.addAttribute("company", company);
		return "update-company";
	}

}
