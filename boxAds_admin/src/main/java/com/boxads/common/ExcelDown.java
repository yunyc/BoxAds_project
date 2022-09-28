package com.boxads.common;


import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import com.boxads.common.vo.ExcelVO;

public class ExcelDown  {
	
	
	public static void buildExcelDocument(ExcelVO excelVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Workbook wb = new SXSSFWorkbook();		
        Cell cell = null;     
        List<HashMap<String, String>> dataList = excelVo.getList();
          
        Sheet sheet = wb.createSheet(excelVo.getSheetName());
        
        // cell width
        for(int i=0; i<excelVo.getWidthArr().length; i++) {
			int width = (Integer.parseInt(excelVo.getWidthArr()[i])-1) * 1000 + 2200;
			sheet.setColumnWidth(i, width);
		}        
        
        // head
        /* ------------------------------css--------------------------------- */
        CellStyle headerStyle = wb.createCellStyle();
		headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);
		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		headerStyle.setAlignment(HorizontalAlignment.CENTER);		
		setBorder(headerStyle);
		Font titleFont = wb.createFont();
		titleFont.setFontHeight((short) (11*20));
		titleFont.setBold(true);
		headerStyle.setFont(titleFont);		
		/* ------------------------------css--------------------------------- */
		
        for(int i = 0; i < excelVo.getHeadArr().length; i++){
            setText(getCell(sheet, 0, i), excelVo.getHeadArr()[i], headerStyle);
            if(dataList.size() < 1){
                cell = getCell(sheet, 1, i);
                if(i == 0){
                    setText(cell, "등록된 정보가 없습니다.", headerStyle);
                }
            }
            
        }
        
        // body        
        /* ------------------------------css--------------------------------- */
        CellStyle bodyStyle = wb.createCellStyle();		
		setBorder(bodyStyle);				
		/* ------------------------------css--------------------------------- */
		
        if(dataList.size() > 0){
            for (int i = 0; i<dataList.size(); i++) {
                HashMap<String, String> dataListMap = dataList.get(i);  
                
                
                if (dataListMap.get("noticeFlag") != null && dataListMap.get("noticeFlag").equals("Y")) {
                	dataListMap.put("no", "공지");
                } else {
                	dataListMap.put("no", (i+1)+"");
                }
                
                for(int j=0; j<excelVo.getBodyArr().length; j++){
                	String str = String.valueOf(dataListMap.get(excelVo.getBodyArr()[j]));
                	if(str==null || str.equals("") || str.equals("null")) str = "-"; 
                    cell = getCell(sheet, 1 + i, j); 
                    setText(cell, str, bodyStyle);
                    //cell.setCellStyle(bodyStyle);
                }
            }
            
        // 저장된 데이터가 없으면 셀 병합
        } else {
            // 셀 병합(시작열, 종료열, 시작행, 종료행)
            sheet.addMergedRegion(new CellRangeAddress(1, 1, 0, excelVo.getHeadArr().length-1));
        }
        

        try {
        	response.setHeader("Set-Cookie", "fileDownload=true; path=/"); 
			response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", URLEncoder.encode(excelVo.getExcelname()+excelVo.addDate()+".xlsx","UTF-8")));
			response.setContentType("application/vnd.ms-excel");


			wb.write(response.getOutputStream());
			response.getOutputStream().close();
	        ((SXSSFWorkbook)wb).dispose();

        } catch (IOException e) {
			e.printStackTrace();
			try {
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} finally {
			try { wb.close(); }
			catch (IOException e) {}
		}
    }

    /**
     * Convenient method to obtain the cell in the given sheet, row and column.
     * 
     * <p>Creates the row and the cell if they still doesn't already exist.
     * Thus, the column can be passed as an int, the method making the needed downcasts.</p>
     * 
     * @param sheet a sheet object. The first sheet is usually obtained by workbook.getSheetAt(0)
     * @param row thr row number
     * @param col the column number
     * @return the XSSFCell
     */
    protected static Cell getCell(Sheet sheet, int row, int col) {
        Row sheetRow = sheet.getRow(row);
        if (sheetRow == null) {
            sheetRow = sheet.createRow(row);
        }
        Cell cell = sheetRow.getCell((short) col);
        if (cell == null) {
            cell = sheetRow.createCell((short) col);
        }
        return cell;
    }

    /**
     * Convenient method to set a String as text content in a cell.
     * 
     * @param cell the cell in which the text must be put
     * @param text the text to put in the cell
     * @param headerStyle 
     */
    protected static void setText(Cell cell, String text, CellStyle style) {
        cell.setCellValue(text);
        cell.setCellStyle(style);
    } 
    
	protected static void setBorder(CellStyle style) {
		style.setBorderRight(BorderStyle.THIN);
		style.setBorderLeft(BorderStyle.THIN);
		style.setBorderTop(BorderStyle.THIN);
		style.setBorderBottom(BorderStyle.THIN);
	}
	
	/**
	 * 엑셀  write
	 * @param request
	 * @param response
	 * @param workbook
	 * @param title
	 */
	public static void finallyWrite(HttpServletRequest request, HttpServletResponse response,
			HSSFWorkbook workbook, String title) {
		try {
			response.setContentType("application/msexcel");
			String userAgent = request.getHeader("User-Agent");
			String filename = title + ".xls";
			// if 익스플로러일 경우 else
			if(userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1) {
				filename = URLEncoder.encode(filename, "utf-8");
				response.setHeader("Content-Disposition", "attachment; filename=" + filename + ";");
			} else {
				filename = new String(filename.getBytes(), "ISO-8859-1");
				response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
			}
			workbook.write(response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
			try {
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		} finally {
			try { workbook.close(); }
			catch (IOException e) {}
		}
	}
}
