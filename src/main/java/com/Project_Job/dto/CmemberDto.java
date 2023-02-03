package com.Project_Job.dto;

public class CmemberDto {
	private String cmcinum;
	private String cmid;
	private String cmpw;
	private String cmname;
	private String cmemail;
	private String cmstate;
	
	public String getCmcinum() {
		return cmcinum;
	}
	public void setCmcinum(String cmcinum) {
		this.cmcinum = cmcinum;
	}
	public String getCmid() {
		return cmid;
	}
	public void setCmid(String cmid) {
		this.cmid = cmid;
	}
	public String getCmpw() {
		return cmpw;
	}
	public void setCmpw(String cmpw) {
		this.cmpw = cmpw;
	}
	public String getCmname() {
		return cmname;
	}
	public void setCmname(String cmname) {
		this.cmname = cmname;
	}
	public String getCmemail() {
		return cmemail;
	}
	public void setCmemail(String cmemail) {
		this.cmemail = cmemail;
	}
	public String getCmstate() {
		return cmstate;
	}
	public void setCmstate(String cmstate) {
		this.cmstate = cmstate;
	}
	@Override
	public String toString() {
		return "CmemberDto [cmcinum=" + cmcinum + ", cmid=" + cmid + ", cmpw=" + cmpw + ", cmname=" + cmname
				+ ", cmemail=" + cmemail + ", cmstate=" + cmstate + "]";
	}
	
	
	
	
}
