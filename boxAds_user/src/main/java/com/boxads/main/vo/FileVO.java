package com.boxads.main.vo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	
	private static final String[] img = {"jpg", "jpeg", "bmp", "gif", "png"};
	private static final String[] vdo = {};
	private static final String[] etc = {"ppt", "pptx", "xls", "xlsx", "doc", "docx"};
	
	private int idx;
	private int parent;
	private String type;
	private String realName;
	private String tempName;
	private long size;
	private String fileType;
	private String insertDate;
	private String url = "/upload";
	private String uploadPath;
	
	public void transferFile(MultipartFile uploadFile) throws IllegalStateException, IOException {
		File folder = new File(this.uploadPath);
		
		if (!folder.exists()) {
			folder.mkdirs();
		}
		
		writeFile(uploadFile, tempName);
	}
	
	public void writeFile(MultipartFile multipartFile, String saveFileName) throws IOException {
		this.uploadPath = uploadPath + "/" + saveFileName;
		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(this.uploadPath);
		
		fos.write(data);
		fos.close();
	}
	
	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	public void settingFileType(String fileType) {
		fileType = fileType.substring(fileType.lastIndexOf(".") + 1, fileType.length());
		
		if (Arrays.asList(img).contains(fileType)) {
			this.fileType = "IMG";
		
		} else if (Arrays.asList(vdo).contains(fileType)) {
			this.fileType = "VDO";
		
		} else if (Arrays.asList(etc).contains(fileType)) {
			this.fileType = "ETC";
		
		} else {
			this.fileType = "ETC";
		}
	}
	public String getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTempName() {
		return tempName;
	}

	public void setTempName(String tempName) {
		this.tempName = tempName;
	}

	@Override
	public String toString() {
		return "FileVO [idx=" + idx + ", parent=" + parent + ", type=" + type + ", realName=" + realName + ", tempName="
				+ tempName + ", size=" + size + ", fileType=" + fileType + ", insertDate=" + insertDate + ", url=" + url
				+ ", uploadPath=" + uploadPath + "]";
	}


	
	
}
