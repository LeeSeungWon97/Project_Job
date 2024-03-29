package com.Project_Job.dto;

public class ReviewsDto {
	private String rvnum;
	private String rvciname;
	private String rvdate;
	private String rveptype;
	private String rvobj;
	private String rvdif;
	private String rvmid;
	private String rvcontents;
	private String rvtype;
	private String rvstate;
	
	
	public String getRvnum() {
		return rvnum;
	}
	public void setRvnum(String rvnum) {
		this.rvnum = rvnum;
	}
	public String getRvciname() {
		return rvciname;
	}
	public void setRvciname(String rvciname) {
		this.rvciname = rvciname;
	}
	public String getRvdate() {
		return rvdate;
	}
	public void setRvdate(String rvdate) {
		this.rvdate = rvdate;
	}
	public String getRveptype() {
		return rveptype;
	}
	public void setRveptype(String rveptype) {
		this.rveptype = rveptype;
	}
	public String getRvobj() {
		return rvobj;
	}
	public void setRvobj(String rvobj) {
		this.rvobj = rvobj;
	}
	public String getRvdif() {
		return rvdif;
	}
	public void setRvdif(String rvdif) {
		this.rvdif = rvdif;
	}
	public String getRvmid() {
		return rvmid;
	}
	public void setRvmid(String rvmid) {
		this.rvmid = rvmid;
	}
	public String getRvcontents() {
		return rvcontents;
	}
	public void setRvcontents(String rvcontents) {
		this.rvcontents = rvcontents;
	}
	public String getRvtype() {
		return rvtype;
	}
	public void setRvtype(String rvtype) {
		this.rvtype = rvtype;
	}
	public String getRvstate() {
		return rvstate;
	}
	public void setRvstate(String rvstate) {
		this.rvstate = rvstate;
	}
	
	@Override
	public String toString() {
		return "ReviewsDto [rvnum=" + rvnum + ", rvciname=" + rvciname + ", rvdate=" + rvdate + ", rveptype=" + rveptype
				+ ", rvobj=" + rvobj + ", rvdif=" + rvdif + ", rvmid=" + rvmid + ", rvcontents=" + rvcontents
				+ ", rvtype=" + rvtype + ", rvstate=" + rvstate + "]";
	}
	
	
	
	
	
}
