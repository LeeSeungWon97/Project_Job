package com.Project_Job.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.Project_Job.dto.CinfoDto;
import com.Project_Job.dto.EmploymentDto;
import com.Project_Job.dto.EssayDto;
import com.Project_Job.dto.ResumeDto;
import com.Project_Job.dto.ScrapDto;

public interface EmploymentDao {

	@Select("SELECT MAX(EPNUM) FROM EMPLOYMENT ")
	String selectMaxEpnum();

	@Select("SELECT EPNAME FROM EMPLOYMENT WHERE EPNAME = #{epname} AND EPCINAME = #{epciname}")
	String checkEp(@Param("epname") String epname, @Param("epciname") String epciname);

	@Insert("INSERT INTO EMPLOYMENT(EPNUM, EPNAME, EPCINAME, EPEDU, EPCAREER, EPTREAT, EPTYPE, EPMONEY, EPAREA, EPTIME, EPSTATE, EPPOST, EPDEADLINE , EPESSTATE)"
			+ " VALUES(#{epnum},#{epname},#{epciname},#{epedu},#{epcareer},#{eptreat},#{eptype},#{epmoney},#{eparea},#{eptime},#{epstate}, #{eppost}, #{epdeadline}, #{epesstate} ) ")
	int insertEmployments(EmploymentDto epinfo);
	
	@Select("SELECT * FROM CINFO WHERE CINAME LIKE '%${ciname}%'  ")
	ArrayList<Map<String, String>> getWPList(String ciname);

	@Select("SELECT CINAME FROM CINFO WHERE CINAME = #{baseMovieName}")
	String checkCom(String baseCName);

	@Insert("INSERT INTO CINFO(CINUM, CINAME, CIIND, CITYPE, CIMONEY, CILEADER, CIMAJOR, CIHOMEPAGE,CIPEOPLE ,CIEST, CISALES,CIINSURANCE, CIWAGE, CIADDR ) "
			+ "VALUES( #{cinum},#{ciname},#{ciind},#{citype},#{cimoney},"
			+ " #{cileader},#{cimajor},#{cihomepage},#{cipeople},#{ciest},#{cisales},#{ciinsurance},#{ciwage},#{ciaddr} )")
	int insertCinfo(CinfoDto cinfo);

	@Update("UPDATE CINFO SET CIADDR = #{ciaddr} WHERE CINUM = #{cinum} ")
	int updateCiAddr(@Param("cinum") String cinum, @Param("ciaddr") String ciaddr);

	@Select("SELECT MAX(CINUM) FROM CINFO ")
	String selectMaxCinum();
	
	@Select("SELECT EPNUM, EPNAME, EPCINAME, EPEDU, EPCAREER, EPTREAT, EPTYPE, EPMONEY, EPAREA, EPTIME, TO_CHAR(EPPOST,'YY-MM-DD') AS EPPOST, TO_CHAR(EPDEADLINE,'YY-MM-DD') AS EPDEADLINE, EPSTATE, EPESSTATE FROM EMPLOYMENT WHERE EPESSTATE = 'x' ")
	ArrayList<EmploymentDto> getEpList();
	
	@Select("SELECT EPNUM, EPNAME, EPCINAME, EPEDU, EPCAREER, EPTREAT, EPTYPE, EPMONEY, EPAREA, EPTIME, TO_CHAR(EPPOST,'YY-MM-DD') AS EPPOST, TO_CHAR(EPDEADLINE,'YY-MM-DD') AS EPDEADLINE, EPSTATE, EPESSTATE FROM EMPLOYMENT WHERE EPESSTATE = 'Y' ")
	ArrayList<EmploymentDto> getRcList();
	
	@Insert("INSERT INTO RESUME VALUES(#{remid},#{retell},#{reedu},#{recarrer},#{react},#{relicense},#{rehope},'0', 'x' ) ")
	int WriteResume(ResumeDto resumeInfo);
	
	@Select("SELECT REMID FROM RESUME WHERE REMID = #{remid}")
	String selectResumeInfo(String remid);
	
	@Update(" UPDATE RESUME SET RETELL = #{retell} , REEDU = #{reedu} "
			+ ", RECARRER = #{recarrer} , REACT = #{react} "
			+ ",RELICENSE = #{relicense} , REHOPE = #{rehope} "
			+ "WHERE REMID = #{remid} ")
	int UpdateResume(ResumeDto resumeInfo);

	@Select("SELECT CINAME FROM CINFO WHERE CINUM=#{cmcinum}")
	String selectCiName(String cmcinum);
	
	@Insert("INSERT INTO ESSAY VALUES(#{esnum},#{esciname},#{esepnum},#{esmid},#{escontents},'x' )")
	int insertEssay(EssayDto essayInfo);
	
	@Select("SELECT MAX(ESNUM) FROM ESSAY ")
	String selectMaxEsnum();

	@Select("SELECT * FROM RESUME WHERE REMID =#{remid}")
	ResumeDto SelectResume(String remid);
	
	@Select("SELECT EPNAME FROM EMPLOYMENT WHERE EPNUM = #{epnum} ")
	String SelectEpname(String epnum);
	
	@Select("SELECT MAX(SPNUM) FROM SCRAPINFO ")
	String selectMaxSpnum();
	
	@Insert("INSERT INTO SCRAPINFO VALUES(#{spnum},#{spmid},#{spepnum},'Y') ")
	int insertScrap(ScrapDto scrapInfo);
	
	@Delete("DELETE SCRAPINFO WHERE SPMID = #{spmid} AND SPEPNUM = #{spepnum}")
	int deleteScrap(@Param("spmid")String smid,@Param("spepnum") String spepnum);
	
	@Select("SELECT * FROM SCRAPINFO WHERE SPMID = #{spmid} ")
	ArrayList<ScrapDto> selectScrapInfo(String spmid);
	
	
	

}
