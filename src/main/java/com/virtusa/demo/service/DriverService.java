package com.virtusa.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.virtusa.demo.model.Driver;
import com.virtusa.demo.repository.DriverRepository;

@Service
public class DriverService {
	@Autowired
	private DriverRepository driverRepository;
	
	public void save(Driver driver) {
		// TODO Auto-generated method stub
		driverRepository.save(driver);
	}


	public Driver getDriverbyId(long id) {
		// TODO Auto-generated method stub
		return driverRepository.findById(id).orElse(null);
	}
}
