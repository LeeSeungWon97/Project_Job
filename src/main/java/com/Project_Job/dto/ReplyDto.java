package com.Project_Job.dto;

public class ReplyDto {

	private String renum;
	private String rebno;
	private String rewriter;
	private String recontent;
	private String redate;
	private String restate;
	
	private int relikecount;   //댓글추천수
	private String relikeCheck; //댓글 추천 확인
	public String getRenum() {
		return renum;
	}

	public String getRelikeCheck() {
		return relikeCheck;
	}

	public void setRelikeCheck(String relikeCheck) {
		this.relikeCheck = relikeCheck;
	}

	public void setRenum(String renum) {
		this.renum = renum;
	}

	public String getRebno() {
		return rebno;
	}

	public void setRebno(String rebno) {
		this.rebno = rebno;
	}

	public String getRewriter() {
		return rewriter;
	}

	public void setRewriter(String rewriter) {
		this.rewriter = rewriter;
	}

	public String getRecontent() {
		return recontent;
	}

	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}

	public String getRedate() {
		return redate;
	}

	public void setRedate(String redate) {
		this.redate = redate;
	}

	public String getRestate() {
		return restate;
	}

	public void setRestate(String restate) {
		this.restate = restate;
	}

	public int getRelikecount() {
		return relikecount;
	}

	public void setRelikecount(int relikecount) {
		this.relikecount = relikecount;
	}

	@Override
	public String toString() {
		return "ReplyDto [renum=" + renum + ", rebno=" + rebno + ", rewriter=" + rewriter + ", recontent=" + recontent
				+ ", redate=" + redate + ", restate=" + restate + ", relikecount=" + relikecount + ", relikeCheck="
				+ relikeCheck + "]";
	}


	
	
}
