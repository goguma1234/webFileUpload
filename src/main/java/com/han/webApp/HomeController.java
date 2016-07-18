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
	
	//[1] MultipartFile�� �̿��ϴ� ���
	@RequestMapping(value="/fileUp",method=RequestMethod.POST)
	public String fileUpload(Model m,@RequestParam String writer,
			@RequestParam("fileone") MultipartFile mfile1,
			@RequestParam(value="filetwo",required=false) MultipartFile mfile2){//required:�ʼ�
		System.out.println("writer="+writer);
		//�Ķ���� ��
		String fileone=mfile1.getName();
		String filetwo=mfile2.getName();
		//���ε��� ���ϸ�
		String filename1=mfile1.getOriginalFilename();
		String filename2=mfile2.getOriginalFilename();
		System.out.println(fileone+": "+filename1);
		System.out.println(filetwo+": "+filename2);
		
		//���� ���ε� ó��
		try {
			if(mfile1!=null)
				mfile1.transferTo(new File(UP_DIR,filename1));
			if(mfile2!=null)
				mfile2.transferTo(new File(UP_DIR, filename2));
			//÷�� ���� ũ��
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
	//[2] MultipartHttpServletRequest�� �̿��ϴ� ���
	//==> �̰�� ������ �Ķ���͸����� ���� ���� ������ ���ε��ϴ� ��쿡
	//	  �����ϴ�.
	/*  
	 *  String realFolder = "d:/upload";
	 *  File dir = new File(realFolder);
        if (!dir.isDirectory()) {
            dir.mkdirs();
        }
 
        // �Ѿ�� ������ ����Ʈ�� ����
        List<MultipartFile> mf = mhsq.getFiles("uploadFile");
        if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {
             
        } else {
            for (int i = 0; i < mf.size(); i++) {
                // ���� �ߺ��� ó��
                String genId = UUID.randomUUID().toString(); 
                // ���� ���ϸ�
                String originalfileName = mf.get(i).getOriginalFilename(); 
                 
                String saveFileName = genId + "." + getExtension(originalfileName);
                // ����Ǵ� ���� �̸�
 
                String savePath = realFolder + saveFileName; // ���� �� ���� ���
 
                long fileSize = mf.get(i).getSize(); // ���� ������
 
                mf.get(i).transferTo(new File(savePath)); // ���� ����
 
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
		//1.�ø���
		String writer=req.getParameter("writer");
		m.addAttribute("writer", writer);
		//2. ÷������ ���
		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)req;
		List<MultipartFile> flist=mr.getFiles("fileone");
		if(flist!=null){
			for(int i=0;i<flist.size();i++){
				MultipartFile mf=flist.get(i);
				//�Ķ���͸�
				String pName=mf.getName();
				//÷�����ϸ�
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
				���ϸ��� �ߺ����� �ʰ� ���ϸ� �ð� �߰�
            String newFileName = fileName + "_" + System.currentTimeMillis(); 
             
            // ���� ���ε� ���
            String path = adminBoard.getUpDir() + newFileName;
 
            // ���� �̵�
            File f = new File(path);
            multipartFile.transferTo(f); 
				
				 */
				//���� ũ��
				long fsize=mf.getSize();
				try{
				//���ε� ó��
				mf.transferTo(new File(UP_DIR,newFilename));
				System.out.println("���� ���ε� ����");
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
