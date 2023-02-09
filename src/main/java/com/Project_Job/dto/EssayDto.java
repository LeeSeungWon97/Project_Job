package com.Project_Job.dto;

public class EssayDto {
	private String esnum;
	private String esciname;
	private String esepnum;
	private String esmid;
	private String escontents;
	private String esstate;
	public String getEsnum() {
		return esnum;
	}
	public void setEsnum(String esnum) {
		this.esnum = esnum;
	}
	public String getEsciname() {
		return esciname;
	}
	public void setEsciname(String esciname) {
		this.esciname = esciname;
	}
	public String getEsepnum() {
		return esepnum;
	}
	public void setEsepnum(String esepnum) {
		this.esepnum = esepnum;
	}
	public String getEsmid() {
		return esmid;
	}
	public void setEsmid(String esmid) {
		this.esmid = esmid;
	}
	public String getEscontents() {
		return escontents;
	}
	public void setEscontents(String escontents) {
		this.escontents = escontents;
	}
	public String getEsstate() {
		return esstate;
	}
	public void setEsstate(String esstate) {
		this.esstate = esstate;
	}
	@Override
	public String toString() {
		return "EssayDto [esnum=" + esnum + ", esciname=" + esciname + ", esepnum=" + esepnum + ", esmid=" + esmid
				+ ", escontents=" + escontents + ", esstate=" + esstate + "]";
	}
	
	
	
}
