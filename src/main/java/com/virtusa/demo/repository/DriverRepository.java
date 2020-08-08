package com.virtusa.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.virtusa.demo.model.Driver;


@Repository
public interface DriverRepository extends JpaRepository<Driver, Long> {
	

	
}
