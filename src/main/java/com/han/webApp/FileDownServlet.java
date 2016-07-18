package com.han.webApp;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*web.xml 에 서블릿 등록하지 않고 사용하기 위해
 * @WebServlet 어노테이션을 사용한다. 
 * 이 어노테이션을 사용 안하면 web.xml에 서블릿을 등록하고
 * url-mapping을 해주어야 함.
 * */
//@WebServlet("/FileDown")
public class FileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest req,
			HttpServletResponse res) 
					throws ServletException, IOException {
		//1.다운로드할 파일명 받기
		String filename=req.getParameter("filename");
		System.out.println("filename="+filename);
		if(filename==null||filename.trim().isEmpty()){			
			return;
		}
		//2. 업로드 디렉토리의 절대경로 얻기
		//JSP:내장객체 => application [ServletContext타입]
		HttpSession ses=req.getSession();//세션을 먼저 얻고
		ServletContext app=ses.getServletContext();
		//세션을 통해 ServletContext를 얻는다.
		//String upDir=app.getRealPath("/upload");
		String upDir="d:/upload";
		
		//한글파일명 깨지는 것을 막기 위해
	String filename_en=new String(filename.getBytes(),"ISO-8859-1");
		
		//response 헤더에 컨텐트 타입을 설정
		//=> 컨텐트 타입이 브라우저가 알 수 있는 타입이면
		//	  브라우저는 파싱하여 보여주고, 만약 모르는 컨텐트
		//    타입이라면 다운로드창을 실행시킨다.
		res.setContentType("application/unknown");//다운로드 창을 실행
		String attch="attachment; filename="+filename_en;
		res.setHeader("Content-Disposition", attch);
		//다운로드할 파일명이 나옴
		
		//해당 파일과 스트림 연결(해당 파일을 읽어서
		//	클라이언트 쪽으로 내보내는 작업을 해야 함)
		FileInputStream fis=new FileInputStream(upDir+"/"+filename);
		BufferedInputStream bis=new BufferedInputStream(fis);
		
		ServletOutputStream sos=res.getOutputStream();
		BufferedOutputStream bos=new BufferedOutputStream(sos);
		
		int n=0;
		byte[]data=new byte[1024];
		while((n=bis.read(data))!=-1){
			bos.write(data,0,n);
			bos.flush();
		}
		if(bis!=null)bis.close();
		if(fis!=null)fis.close();
		
		if(bos!=null)bos.close();
		if(sos!=null)sos.close();

	}


}
