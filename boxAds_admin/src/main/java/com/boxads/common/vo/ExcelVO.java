package com.boxads.common.vo;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class ExcelVO {
	private String excelname;
	private String[] headArr;
	private String[] bodyArr;
	private String[] widthArr;
	private String sheetName = "리스트";	
	private List<HashMap<String, String>> list;
	
	
	public String addDate() {
		SimpleDateFormat sf = new SimpleDateFormat ("yyyy-MM-dd");
		Date time = new Date();			
		return sf.format(time);
	}
	
	public void setData(String excelname, String head, String body, String width, String sheetName,
			List<HashMap<String, String>> list) {		
		this.excelname = excelname;
		this.headArr = head.split(",");
		this.bodyArr = body.split(",");;
		this.widthArr = width.split(",");;
		this.sheetName = sheetName;
		this.list = list;
	}
	
	
	public String getExcelname() {
		return excelname;
	}
	public void setExcelname(String excelname) {
		this.excelname = excelname;
	}
	public String[] getHeadArr() {
		return headArr;
	}
	public void setHeadArr(String[] headArr) {
		this.headArr = headArr;
	}
	public String[] getBodyArr() {
		return bodyArr;
	}
	public void setBodyArr(String[] bodyArr) {
		this.bodyArr = bodyArr;
	}
	public String getSheetName() {
		return sheetName;
	}
	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}
	public List<HashMap<String, String>> getList() {
		return list;
	}
	public void setList(List<HashMap<String, String>> list) {
		this.list = list;
	}
	public String[] getWidthArr() {
		return widthArr;
	}
	public void setWidthArr(String[] widthArr) {
		this.widthArr = widthArr;
	}
	@Override
	public String toString() {
		return "ExcelVO [excelname=" + excelname + ", headArr=" + Arrays.toString(headArr) + ", bodyArr="
				+ Arrays.toString(bodyArr) + ", widthArr=" + Arrays.toString(widthArr) + ", sheetName=" + sheetName
				+ ", list=" + list + "]";
	}
	
	
	
	
	

}
