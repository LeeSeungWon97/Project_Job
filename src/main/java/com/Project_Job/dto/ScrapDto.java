package com.Project_Job.dto;

public class ScrapDto {

	private String spnum;	
	private String spmid;	
	private String spepnum;	
	private String spstate;
	public String getSpnum() {
		return spnum;
	}
	public void setSpnum(String spnum) {
		this.spnum = spnum;
	}
	public String getSpmid() {
		return spmid;
	}
	public void setSpmid(String spmid) {
		this.spmid = spmid;
	}
	public String getSpepnum() {
		return spepnum;
	}
	public void setSpepnum(String spepnum) {
		this.spepnum = spepnum;
	}
	public String getSpstate() {
		return spstate;
	}
	public void setSpstate(String spstate) {
		this.spstate = spstate;
	}
	@Override
	public String toString() {
		return "ScrapDto [spnum=" + spnum + ", spmid=" + spmid + ", spepnum=" + spepnum + ", spstate=" + spstate + "]";
	}


}
