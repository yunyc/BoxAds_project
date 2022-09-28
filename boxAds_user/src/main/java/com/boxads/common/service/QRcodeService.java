package com.boxads.common.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.ad.vo.AdVO;
import com.boxads.common.mapper.SerialMapper;
import com.boxads.main.mapper.BoardMapper;
import com.boxads.main.mapper.CommonMapper;
import com.boxads.main.mapper.FileMapper;
import com.boxads.main.service.FileService;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;


@Transactional
@Service
public class QRcodeService {
	
	@Resource private CommonMapper commonMapper;
	@Resource private FileService fileService;
	@Resource private String uploadPath;
	@Autowired private Environment mailConfig;
	
	public HashMap<String, Object> selectQRcode(AdVO adVO) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("qIdx", adVO.getqIdx());
		map.put("parent", adVO.getIdx());
		return commonMapper.selectQRcode(map);
	}
	
	public void updateCnt(AdVO adVO) throws Exception {
		commonMapper.updateCnt(adVO);
	}
	
	public int createQRcode(int qIdx, int parent, String siteUrl) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String fileName = UUID.randomUUID().toString().replace("-", "").substring(0, 8) +  "qrcode.png";
		String url = mailConfig.getProperty("url");
		// 단축 url
		String qrcodeUrl = url + "common/qrcode?idx=";
		
		map.put("qIdx", qIdx);
		map.put("parent", parent);
		map.put("siteUrl", siteUrl);
		map.put("url", "/upload/qrcode/" + fileName);
		
		commonMapper.insertQRcode(map);
		siteUrl = qrcodeUrl + map.get("idx");
		
		if (qIdx == 0) {
			
			try {
	            File file = null;
	            // 큐알이미지를 저장할 디렉토리 지정
	            file = new File(uploadPath + "/qrcode");
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            // 코드인식시 링크걸 URL주소
	            String codeurl = new String(siteUrl.getBytes("UTF-8"), "ISO-8859-1");
	            // 큐알코드 바코드 생상값
	            int qrcodeColor =   0x00000000;
	            // 큐알코드 배경색상값
	            int backgroundColor = 0xFFFFFFFF;
	             
	            QRCodeWriter qrCodeWriter = new QRCodeWriter();
	            // 3,4번째 parameter값 : width/height값 지정
	            BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE,200, 200);
	            //
	            MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor,backgroundColor);
	            BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix,matrixToImageConfig);
	            // ImageIO를 사용한 바코드 파일쓰기
	            
	            File QRcode = new File(uploadPath + "/qrcode/" + fileName);
	            ImageIO.write(bufferedImage, "png", QRcode);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		}
		
		
		return Integer.parseInt(map.get("qIdx").toString());
	}
	
}
