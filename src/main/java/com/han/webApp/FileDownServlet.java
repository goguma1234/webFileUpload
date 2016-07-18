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
/*web.xml �� ���� ������� �ʰ� ����ϱ� ����
 * @WebServlet ������̼��� ����Ѵ�. 
 * �� ������̼��� ��� ���ϸ� web.xml�� ������ ����ϰ�
 * url-mapping�� ���־�� ��.
 * */
//@WebServlet("/FileDown")
public class FileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest req,
			HttpServletResponse res) 
					throws ServletException, IOException {
		//1.�ٿ�ε��� ���ϸ� �ޱ�
		String filename=req.getParameter("filename");
		System.out.println("filename="+filename);
		if(filename==null||filename.trim().isEmpty()){			
			return;
		}
		//2. ���ε� ���丮�� ������ ���
		//JSP:���尴ü => application [ServletContextŸ��]
		HttpSession ses=req.getSession();//������ ���� ���
		ServletContext app=ses.getServletContext();
		//������ ���� ServletContext�� ��´�.
		//String upDir=app.getRealPath("/upload");
		String upDir="d:/upload";
		
		//�ѱ����ϸ� ������ ���� ���� ����
	String filename_en=new String(filename.getBytes(),"ISO-8859-1");
		
		//response ����� ����Ʈ Ÿ���� ����
		//=> ����Ʈ Ÿ���� �������� �� �� �ִ� Ÿ���̸�
		//	  �������� �Ľ��Ͽ� �����ְ�, ���� �𸣴� ����Ʈ
		//    Ÿ���̶�� �ٿ�ε�â�� �����Ų��.
		res.setContentType("application/unknown");//�ٿ�ε� â�� ����
		String attch="attachment; filename="+filename_en;
		res.setHeader("Content-Disposition", attch);
		//�ٿ�ε��� ���ϸ��� ����
		
		//�ش� ���ϰ� ��Ʈ�� ����(�ش� ������ �о
		//	Ŭ���̾�Ʈ ������ �������� �۾��� �ؾ� ��)
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
