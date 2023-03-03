package com.Project_Job.dto;

public class BoardDto {

	private String bno;
	private String bmid;
	private String btitle;
	private String bcontents;
	private String bdate;
	private String bhope;
	private int bcount;
	private int breplycount;
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getBmid() {
		return bmid;
	}
	public void setBmid(String bmid) {
		this.bmid = bmid;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontents() {
		return bcontents;
	}
	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getBhope() {
		return bhope;
	}
	public void setBhope(String bhope) {
		this.bhope = bhope;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}
	public int getBreplycount() {
		return breplycount;
	}
	public void setBreplycount(int breplycount) {
		this.breplycount = breplycount;
	}
	@Override
	public String toString() {
		return "BoardDto [bno=" + bno + ", bmid=" + bmid + ", btitle=" + btitle + ", bcontents=" + bcontents
				+ ", bdate=" + bdate + ", bhope=" + bhope + ", bcount=" + bcount + ", breplycount=" + breplycount + "]";
	}
	
	
	
}
