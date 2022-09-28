package com.boxads.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.order.mapper.OrderMapper;
import com.boxads.main.service.FileService;
import com.boxads.main.vo.FileVO;
import com.boxads.order.mapper.LogMapper;
import com.boxads.order.vo.LogVO;
import com.boxads.order.vo.OrderVO;
import com.boxads.product.vo.ProductVO;

@Transactional
@Service
public class OrderService {
	@Resource private OrderMapper orderMapper;
	@Resource private LogMapper logMapper;
	@Resource private FileService fileService;

	
	public List<HashMap<String, String>> selectOrderList(OrderVO odvo) throws Exception {
		return orderMapper.selectOrderList(odvo);
	}
	
	public void updateState(HashMap<String, Object> map) throws Exception {
		orderMapper.insertMemoList(map);
	}
	
	public HashMap<String, Object> selectQRcode(OrderVO odvo) throws Exception {
		return orderMapper.selectQRcode(odvo);
	}
	
	public List<HashMap<String, Object>> selectMemoList(OrderVO odvo) throws Exception {
		return orderMapper.selectMemoList(odvo);
	}
	
	public void insertMemoList(HashMap<String, Object> map) throws Exception {
		orderMapper.insertMemoList(map);
	}
	
	public List<LogVO> selectProcessLog(LogVO lvo) throws Exception {
		return logMapper.selectProcessLog(lvo);
	}
	
	public Long selectLogCnt(LogVO lvo) throws Exception {
		HashMap<String, Long> map = logMapper.selectLogCnt(lvo);
		
		return map.get("logCnt");
	}
	
	public Long selectOrderCnt(OrderVO odVO) throws Exception {
		HashMap<String, Long> map = orderMapper.selectOrderCnt(odVO);
		
		return map.get("orderCnt");
	}
	
	
	
public LogVO setLog(OrderVO odvo, LogVO lvo) throws Exception {		
		
		HashMap<String, String> nameMap = orderMapper.selectOrderName(odvo); 
		
		String boxName = nameMap.get("boxName");
		String adName = nameMap.get("adName");
		
		switch (lvo.getType()) {
		// 박스
		case "B1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "광고주 " + adName + "님이 박스 상품을 구매하였습니다.", "N", null, "T");
			break;
		case "B2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "광고주 " + adName + "님이 구매한 광고를 승인해주세요.", "Y", null, "B");
			lvo.setAction("CF");
			break;
		case "B3":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님이 박스 상품 구매를 승인하였습니다.", "N", null, "T");
			break;		
		case "B4":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "광고주 " + adName + "님의 홍보물 제작이 자동 발주 되었습니다.", "N", null, "T");
			lvo.setPrintState(lvo.getType());
			lvo.setPrintContent("신규발주");
			break;
		case "B5":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "홍보물 이미지의 디자인 검수가 완료되었습니다.", "N", null, "T");
			lvo.setPrintState(lvo.getType());
			lvo.setPrintContent("디자인 검수");
			break;
		case "B6":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "홍보물 이미지의 디자인 수정이 완료되었습니다.", "N", null, "T");
			lvo.setPrintState(lvo.getType());
			lvo.setPrintContent("디자인 수정");
			break;
		case "B7":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "홍보물의 인쇄 제작이 시작되었습니다. (영업일 기준 평균 3일 소요)", "N", null, "T");
			lvo.setPrintState(lvo.getType());
			lvo.setPrintContent("홍보물 제작중");
			break;
		case "B8":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "홍보물 인쇄 제작이 완료되어 포장을 하고 있습니다.", "N", null, "T");
			lvo.setPrintState(lvo.getType());
			lvo.setPrintContent("홍보물 제작완료");
			break;
		case "B9":
			String delivery = lvo.getDelivery();
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님에게 인쇄 홍보물이 발송되었습니다.", "Y", lvo.getMesg(), "T");
			lvo.setPrintState(lvo.getType());
			lvo.setPrintContent("배송 처리");
			lvo.setDelivery(delivery);
			lvo.setAction("DV");
			break;
		case "B10":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "광고주 " + adName + "님, 샘플 홍보물 배송 정보를 입력해주세요.", "Y", lvo.getMesg(), "A");
			lvo.setAction("DI");
			break;
		case "B11":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님에게 샘플 홍보물이 발송되었습니다.", "Y", lvo.getMesg(), "T");			
			lvo.setAction("DV");
			break;
		case "B12-1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "광고주 " + adName + "님 홍보물의 전국 배포를 시작했습니다.", "N", null, "A");
			break;
		case "B12-2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "광고주 " + adName + "님 홍보물을 택배상자에 동봉하여 발송해주세요.", "N", null, "B");
			break;
		case "B13":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님, 홍보물의 택배상자 동봉 1차 인증사진을 등록해주세요. (최대 2장)", "Y", null, "B");
			lvo.setAction("II1");
			break;
		case "B14":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님이 1차 인증사진을 등록하였습니다.", "Y", null, "T");
			lvo.setAction("IV1");
			break;
		case "B15-1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "박스애드에서 1차 인증사진을 승인하였습니다.", "N", null, "T");
			break;
		case "B15-2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "박스애드에서 1차 인증사진을 반려하였습니다. 반려사유 확인 후 다시 등록해주세요.", "Y", lvo.getMesg(), "B");
			lvo.setAction("II1R");
			
			lvo.setReasonState("O");
			lvo.setReasonType("F");
			break;
		case "B17-1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님이 1차 인증사진을 미등록하여 확인중입니다. 궁금한 사항이 있으면 운영자에게 문의해주세요.", "Y", null, "A");
			lvo.setAction("Q");
			break;
		case "B17-2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님, 1차 인증사진이 미등록되었습니다. 인증을 하려면 운영자에게 문의해주세요.", "Y", null, "B");
			lvo.setAction("Q");
			break;
		case "B18":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님, 홍보물의 택배상자 동봉 2차 인증사진을 등록해주세요. (최대 2장)", "Y", null, "B");
			lvo.setAction("II2");
			break;
		case "B19":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님이 2차 인증사진을 등록하였습니다.", "Y", null, "T");
			lvo.setAction("IV2");
			break;
		case "B20-1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "박스애드에서 2차 인증사진을 승인하였습니다.", "N", null, "T");
			break;
		case "B20-2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "박스애드에서 2차 인증사진을 반려하였습니다. 반려사유 확인 후 다시 등록해주세요.", "Y", lvo.getMesg(), "B");
			lvo.setAction("II2R");
			
			lvo.setReasonState("T");
			lvo.setReasonType("F");
			break;
		case "B21-1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님이 2차 인증사진을 미등록하여 확인중입니다. 궁금한 사항이 있으면 운영자에게 문의해주세요.", "Y", null, "A");
			lvo.setAction("Q");
			break;
		case "B21-2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님, 2차 인증사진이 미등록되었습니다. 인증을 하려면 운영자에게 문의해주세요.", "Y", null, "B");
			lvo.setAction("Q");
			break;
		case "B22-1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "광고주 " + adName + "님 홍보물의 전국 배포가 완료되었습니다.\n박스애드에서 최종 확인 후 결제 후 에스크로되어 있던 광고비와 인쇄비를 정산합니다.\n정산 결과는 캐시내역 메뉴에서 확인하실 수 있습니다.", "N", null, "A");			
			break;
		case "B22-2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "광고주 " + adName + "님 홍보물의 전국 배포가 완료되었습니다.\n박스애드에서 최종 확인 후 광고비(캐시)를 정산하여 지급합니다. 정산 결과는 캐시내역 메뉴에서 확인하실 수 있습니다.", "N", null, "B");
			break;
		case "B23":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "광고주 " + adName + "님이 박스 상품 구매를 취소하였습니다.", "N", null, "T");

			int printChk = logMapper.selectPrintLogChk(odvo.getIdx());
			
			// 승인 후 발주 상태에서 취소 시 인쇄로그 입력
			if(printChk > 0){
				lvo.setPrintState("B0");
				lvo.setPrintContent("발주취소");
			}
			
			break;
		case "B24":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님이 박스 상품 광고 진행을 거부하였습니다.", "Y", lvo.getMesg(), "T");
			lvo.setAction("MV");
			
			int printChk2 = logMapper.selectPrintLogChk(odvo.getIdx());
			
			// 승인 후 발주 상태에서 취소 시 인쇄로그 입력
			if(printChk2 > 0){
				lvo.setPrintState("B0");
				lvo.setPrintContent("발주취소");
			}
			
			break;
			
		// 애드
		case "A1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님이 광고 유치를 신청하였습니다.", "N", null, "T");
			break;
		case "A2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님의 광고 유치 신청이 마음에 들면 \"좋아요\" 승인해주세요.", "Y", null, "A");
			lvo.setAction("CF");
			break;
		case "A3":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "광고주 " + adName + "님이 광고 유치 신청을 \"좋아요\" 승인하였습니다.", "N", null, "T");
			break;
		case "A4":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "광고주 " + adName + "님, 신청 받은 박스 상품을 주문하세요.\n전국에 있는 신규 고객을 확보 할 수 있는 새로운 광고 채널, 박스애드를 지금 이용해보세요.", "Y", null, "A");
			lvo.setAction("BUY");
			break;
		case "A5":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "광고주 " + adName + "님이 신청 받은 박스 상품을 구매하였습니다.", "N", null, "T");
			break;
		case "A6":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님이 광고 유치 신청을 취소하였습니다.", "N", null, "T");
			break;
		default:
			break;
		}		
		
		return lvo;
	}	
	

	public int updateState(OrderVO odvo, String logTypeArr, @RequestParam String mesg) throws Exception {
		
		int success = orderMapper.updateOrder(odvo);
		
		if(success > 0) {			
			
			// 프로세스 이력에 로그 넣기
			for (String type : logTypeArr.split(",")) {
								
				LogVO lvo = new LogVO(type, mesg);				
				lvo = setLog(odvo, lvo);
				logMapper.insertProcessLog(lvo);
				
				if(lvo.getPrintState() != null) {
					logMapper.insertPrintLog(lvo);					
				}
			}
		}
		
		return success;
	}
	
	// 로그 입력
	public int insertProcessLog(OrderVO odvo, String logTypeArr, String mesg, String delivery) throws Exception {
		
		int success = 0;
		
		if(odvo.getIdx() > 0) {
							
			// 프로세스 이력에 로그 넣기
			for (String type : logTypeArr.split(",")) {
				LogVO lvo = new LogVO(type, mesg);			
				lvo.setDelivery(delivery);
				lvo = setLog(odvo, lvo);
				success = logMapper.insertProcessLog(lvo);
				
				if(lvo.getPrintState() != null) {
					logMapper.insertPrintLog(lvo);					
				}
			}
		}
		
		return success;
	}
	
	public int insertFileNlog(HashMap<String, String> param, List<MultipartFile> file) throws Exception {
		int success = 0;
		List<FileVO> fileVOList = new ArrayList<FileVO>();
		
		String state = param.get("state");
		OrderVO odvo = new OrderVO(Integer.parseInt(param.get("idx")));
		odvo.setState(state);
		
		if(state != null && state.equals("B4") || state != null && state.equals("B5")) {
			orderMapper.updateOrder(odvo);			
		} 
		
		// 프로세스 이력에 로그 넣기
		for (String type : param.get("logTypeArr").split(",")) {							
			LogVO lvo = new LogVO(type, param.get("mesg"));	
			lvo.setDelivery(param.get("delivery"));
			lvo = setLog(odvo, lvo);
			success = logMapper.insertProcessLog(lvo);
			
			if(lvo.getPrintState() != null) {
				logMapper.insertPrintLog(lvo);
			}
			
			fileService.listSetting(0, lvo.getIdx(), type, param.get("path"), file, fileVOList);
			fileService.insertFile(lvo.getIdx(), fileVOList);
		}
		return success;		
	}

	public HashMap<String, Object> selectQRcode(HashMap<String, Object> param) throws Exception {
		int idx = Integer.parseInt(param.get("idx").toString());
		OrderVO odvo = new OrderVO(idx);
		return orderMapper.selectQRcode(odvo);
	}
}