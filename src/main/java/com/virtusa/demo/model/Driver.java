package com.virtusa.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity

public class Driver {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long drid;
	private String dname;
	private String dpassword;
	private long dmobile;
	public long getDrid() {
		return drid;
	}
	public void setDrid(long drid) {
		this.drid = drid;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDpassword() {
		return dpassword;
	}
	public void setDpassword(String dpassword) {
		this.dpassword = dpassword;
	}
	public long getDmobile() {
		return dmobile;
	}
	public void setDmobile(long dmobile) {
		this.dmobile = dmobile;
	}
	
	

}
