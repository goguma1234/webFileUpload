package com.han.webApp;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private final String UP_DIR="d:/upload";
	
	@RequestMapping("/fileForm")
	public String showForm(){
		return "fileup/fileUpload";
	}
	
	@RequestMapping("/fileForm2")
	public String showForm2(){
		return "fileup/fileUpload2";
	}
	
	//[1] MultipartFile을 이용하는 방법
	@RequestMapping(value="/fileUp",method=RequestMethod.POST)
	public String fileUpload(Model m,@RequestParam String writer,
			@RequestParam("fileone") MultipartFile mfile1,
			@RequestParam(value="filetwo",required=false) MultipartFile mfile2){//required:필수
		System.out.println("writer="+writer);
		//파라미터 명
		String fileone=mfile1.getName();
		String filetwo=mfile2.getName();
		//업로드한 파일명
		String filename1=mfile1.getOriginalFilename();
		String filename2=mfile2.getOriginalFilename();
		System.out.println(fileone+": "+filename1);
		System.out.println(filetwo+": "+filename2);
		
		//파일 업로드 처리
		try {
			if(mfile1!=null)
				mfile1.transferTo(new File(UP_DIR,filename1));
			if(mfile2!=null)
				mfile2.transferTo(new File(UP_DIR, filename2));
			//첨부 파일 크기
			long fsize1=mfile1.getSize();
			long fsize2=mfile2.getSize();
			
			m.addAttribute("filename1",filename1);
			m.addAttribute("filename2",filename2);
			m.addAttribute("fsize1", fsize1);
			m.addAttribute("fsize2", fsize2);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "fileup/result";
	}//---------------------------
	//[2] MultipartHttpServletRequest를 이용하는 경우
	//==> 이경우 동일한 파라미터명으로 여러 개의 파일을 업로드하는 경우에
	//	  유용하다.
	/*  
	 *  String realFolder = "d:/upload";
	 *  File dir = new File(realFolder);
        if (!dir.isDirectory()) {
            dir.mkdirs();
        }
 
        // 넘어온 파일을 리스트로 저장
        List<MultipartFile> mf = mhsq.getFiles("uploadFile");
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
             
        } else {
            for (int i = 0; i < mf.size(); i++) {
                // 파일 중복명 처리
                String genId = UUID.randomUUID().toString(); 
                // 본래 파일명
                String originalfileName = mf.get(i).getOriginalFilename(); 
                 
                String saveFileName = genId + "." + getExtension(originalfileName);
                // 저장되는 파일 이름
 
                String savePath = realFolder + saveFileName; // 저장 될 파일 경로
 
                long fileSize = mf.get(i).getSize(); // 파일 사이즈
 
                mf.get(i).transferTo(new File(savePath)); // 파일 저장
 
                bbsService.fileUpload(originalfileName, saveFileName, fileSize);
            }
        }
	 * 
	 */
	@RequestMapping(value="/fileUp2",method=RequestMethod.POST)
	public String fileUpload2(Model m,HttpServletRequest req){
		 String realFolder = "d:/upload/";
		 File dir = new File(realFolder);
	        if (!dir.isDirectory()) {
	            dir.mkdirs();
	        }
		//1.올린이
		String writer=req.getParameter("writer");
		m.addAttribute("writer", writer);
		//2. 첨부파일 목록
		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)req;
		List<MultipartFile> flist=mr.getFiles("fileone");
		if(flist!=null){
			for(int i=0;i<flist.size();i++){
				MultipartFile mf=flist.get(i);
				//파라미터명
				String pName=mf.getName();
				//첨부파일명
				String filename=mf.getOriginalFilename();
			    System.out.println("filename="+filename);
			
			    File f = new File(realFolder+"/"+filename);
			    int rename =1;
			    String newFilename=filename;
			    while(f.exists()){
			    	int extentionIdx = newFilename.lastIndexOf(".");
			    	String fname = newFilename.substring(0,extentionIdx);
			    	String exe = newFilename.substring(extentionIdx+1);
			    	 System.out.println("11="+fname);
			    	 System.out.println("11="+exe);
			    	 f = new File(realFolder+"/"+fname + rename+"."+exe);
			    	 if(!f.exists()){newFilename=f.getName();
			    	 System.out.println("newFilename="+newFilename);
			    	 break;
			    	 }
			    	 rename++;
			    }
				/*
				파일명이 중복되지 않게 파일명에 시간 추가
            String newFileName = fileName + "_" + System.currentTimeMillis(); 
             
            // 파일 업로드 경로
            String path = adminBoard.getUpDir() + newFileName;
 
            // 파일 이동
            File f = new File(path);
            multipartFile.transferTo(f); 
				
				 */
				//파일 크기
				long fsize=mf.getSize();
				try{
				//업로드 처리
				mf.transferTo(new File(UP_DIR,newFilename));
				System.out.println("파일 업로드 성공");
				}catch(Exception e){
					e.printStackTrace();
				}
				m.addAttribute("filename"+i, filename);
				m.addAttribute("fsize"+i, fsize);
			}//for-----------
		}//if--------------------
		
		
		return "fileup/result2";
	}
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
