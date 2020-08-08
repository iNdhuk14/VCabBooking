package com.virtusa.demo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.virtusa.demo.model.Driver;
import com.virtusa.demo.service.DriverService;



@Controller
public class DriverController {

    @Autowired
    DriverService driverService;
    
    @RequestMapping("/DriverLogin")
	public String DriverLoginPage()
	{
		return "DriverLogin";
	}
    
    @RequestMapping("/DriverSignUp")
	public String DriverSignUpPage()
	{
		return "DriverSignUp";
	}
    
    @RequestMapping("/AcceptRide")
	public String AcceptRide(@RequestParam("id") long id,@RequestParam("password") String password,Model model)
	{
    	Driver driver=null;
		driver=driverService.getDriverbyId(id);
		if(driver!=null && driver.getDpassword().equals(password))
		{
			model.addAttribute("id",driver.getDrid());
			return "/AcceptRide";
		}
		return "/DriverLogin";
	}
    
    @RequestMapping("/adddriver")
    public String addDriver(@RequestParam("driverName") String driverName, @RequestParam("password1") String dpassword, @RequestParam("mobile") long mobile,Model model) {

        Driver driver = new Driver();
       // driver.setDrid(100);
        driver.setDname(driverName);
        driver.setDpassword(dpassword);
        driver.setDmobile(mobile);
        driverService.save(driver);
        
        model.addAttribute("id",driver.getDrid());
        return "AcceptRide";

    }
}