package kr.co.copang.boardPro.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletContext;
import javax.servlet.http.Part;

public class UploadUtil {
	
	private String uploadPath;
	private ServletContext app;
	
	public static UploadUtil create(ServletContext app) {
		
		UploadUtil uploadUtil = new UploadUtil();
		uploadUtil.setApp(app);
		uploadUtil.setUploadPath(app.getRealPath("C:\\dev\\work-space\\semiProject\\semiProject\\src\\main\\webapp\\resources\\upload"));
		
		return uploadUtil;
		
	}
	
	private void setApp(ServletContext app) {
		this.app = app;
	}
	
	private void setUploadPath(String realPath) {
		this.uploadPath = realPath;
	}
	
	public void saveFiles(Part filePart, String folderPath) {
		
		String realPath = this.uploadPath + File.separator + folderPath;
		String filePath = realPath + filePart.getSubmittedFileName();
		
		try(	InputStream fis = filePart.getInputStream();
				OutputStream fos = new FileOutputStream(filePath);) {
			
			byte[] buf = new byte[1024];
			int len = 0;
			
			while((len = fis.read(buf, 0, 1024)) != -1)
				fos.write(buf, 0, len);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public String createFilePath() {
		
		LocalDateTime date = LocalDateTime.now(); 
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String[] paths = formatter.format(date).split("/");
		
		String result = paths[0] + File.separator + paths[1] + File.separator + paths[2];
		
		createFolders(result);
		
		return result;
		
	}
	
	private void createFolders(String paths) {
		
		File folders = new File(uploadPath, paths);
		
		if(!folders.exists())
			folders.mkdirs();
	}
	
	
	
	
}
