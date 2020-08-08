package com.virtusa.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.virtusa.demo.model.users;

@Repository
public interface UserRepository extends JpaRepository<users, Long> {

	


}
