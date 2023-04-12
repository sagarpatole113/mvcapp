package mvcapp.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mvcapp.dao.CompanyDao;
import mvcapp.dao.EmployeeDao;
import mvcapp.model.Company;
import mvcapp.model.Employee;

@Controller
public class EmployeeController {
	
	public static  Integer cmpId = 1;
	
	@Autowired
	private CompanyDao companyDao;

	@Autowired
	private EmployeeDao employeeDao;

	
	@RequestMapping("/employees/{cmpId}")
	public String getAllEmployees(@PathVariable("cmpId") Integer cmpid, Model model) {
		
		cmpId = cmpid;
		
		//Company company = companyDao.getSingleCompany(cmpid);
		
		
		List<Employee> employees = employeeDao.getAllemployee(cmpid);
		
		List<Object> emp = employees.stream()
				.filter(c-> cmpid == c.getCompany()
				.getId())
				.collect(Collectors.toList());
		
		System.out.println("Compnay id = "+cmpid);
		
		//request.getSession().setAttribute("cmpId", cmpid); //new line
		
		//List<Employee> employees = company.getEmployees();
		
		model.addAttribute("employees", emp);

		return "employees";
	}

	// shows add company form
	@RequestMapping("/employees/add-employee")
	public String addEmployee(Model model) {
		model.addAttribute("title", "Add employee");
		return "add-employee";
	}

	// handle add company form request
	@RequestMapping(value = "/employees/submit-employee", method = RequestMethod.POST)
	public String handleEmployee(@ModelAttribute Employee employee, HttpServletRequest request) {
//		System.out.println("Company Id : " + cmpId);
//		
		Company company = companyDao.getSingleCompany(cmpId);// single company object created
//		
		employee.setCompany(company);  //employees company set as particular company 
		
		//System.out.println(company.toString());
	//	System.out.println("Employee to be add : " + employee.toString());

		company.getEmployees().add(employee); //employees added in particular company
		
		employeeDao.createEmployee(employee); // passed employee object to employeeDao to createEmployee method

		return "redirect:/";
	}

	// delete handle request
	@RequestMapping("/employees/delete/{empId}")
	public String deleteEmployee(@PathVariable("empId") Integer empid, HttpServletRequest request) {
		employeeDao.deleteEmployee(empid);
		return "redirect:/";
	}

	// show update company form
	@RequestMapping("/employees/update/{empId}")
	public String updateEmployeeForm(@PathVariable("empId") Integer empid, Model model) {
		Employee employee = this.employeeDao.getSingleEmployee(empid);
		model.addAttribute("employee", employee);
		return "update-employee";
	}
}
