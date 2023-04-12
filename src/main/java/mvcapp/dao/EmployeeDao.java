package mvcapp.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import mvcapp.model.Company;
import mvcapp.model.Employee;

@Component
public class EmployeeDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;


	//create a new employee
		@Transactional
		public void createEmployee(Employee employee)
		{
			this.hibernateTemplate.saveOrUpdate(employee);
		}
		
		//get all employees
		public List<Employee> getAllemployee(Integer cmpid)
		{
		//	Company company = companyDao.getSingleCompany(cmpid);
		    
			List<Employee> employees = this.hibernateTemplate.loadAll(Employee.class);
			
		//	System.out.println("Employees found : " + employees.toString());
			
			return employees;
		}
		
		//delete a single employee
		@Transactional 
		public void deleteEmployee(Integer eid)
		{
			Employee employee = this.hibernateTemplate.load(Employee.class, eid);
			this.hibernateTemplate.delete(employee);
		}
		
		//get a single employee
		public Employee getSingleEmployee(Integer eid)
		{
			return this.hibernateTemplate.get(Employee.class, eid);
		}

}
