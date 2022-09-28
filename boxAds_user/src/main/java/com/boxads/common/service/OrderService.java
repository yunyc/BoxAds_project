package com.boxads.common.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.ad.mapper.AdMapper;
import com.boxads.box.mapper.BoxMapper;
import com.boxads.box.mapper.CodeMapper;
import com.boxads.box.vo.BoxVO;
import com.boxads.cash.mapper.CashMapper;
import com.boxads.cash.vo.CashVO;
import com.boxads.common.mapper.LogMapper;
import com.boxads.common.mapper.OrderMapper;
import com.boxads.common.vo.LogVO;
import com.boxads.common.vo.OrderVO;
import com.boxads.common.vo.PriceVO;
import com.boxads.etc.mapper.CouponMapper;
import com.boxads.etc.vo.CouponVO;
import com.boxads.main.ObjectUtil;
import com.boxads.main.service.FileService;
import com.boxads.main.vo.FileVO;
import com.boxads.main.vo.MemberVO;

@Transactional
@Service
public class OrderService {
	@Resource private OrderMapper orderMapper;
	@Resource private CodeMapper codeMapper;
	@Resource private LogMapper logMapper;
	@Resource private CashMapper cashMapper;
	@Resource private CouponMapper couponMapper;
	@Resource private BoxMapper boxMapper;
	@Resource private FileService fileService;

	public int insertOrderBox(OrderVO odvo, int myCash, HttpSession session) throws Exception {
    	int success = 0;
    	
		// 보유한 금액이 총 금액보다 더 많을 때 주문 가능
    	PriceVO price = codeMapper.selectTotalPriceBefore(odvo);    	
		int total = (price.getPrPrice() + price.getAdPrice()) - price.getCpPrice(); 
				
		if(myCash >= total) {
			int mIdx = ObjectUtil.getMember(session).getIdx();
			
			odvo.setBoxCnt(price.getBoxCnt());
			odvo.setTotalPrice(total);
			odvo.setPdtUnit(price.getUnit());
			odvo.setPrintUnit(price.getPrUnit());
			odvo.setPrintPrice(price.getPrPrice());
			odvo.setState("B1");
			
			// 주문 정보 입력 / 쿠폰 사용처리 / 박스 판매 수 + 1
			success = orderMapper.insertOrder(odvo);
			
			if(success > 0) {
				// 캐시 이력에 로그 셋팅
				CashVO csvo = new CashVO(mIdx, odvo.getIdx(), "M", "B", "박스 상품 구매", -total, null);
					
				// 프로세스 이력에 로그 넣기				
				LogVO log = new LogVO("B1");				
				log = setLog(odvo, log);					
				logMapper.insertProcessLog(log);
				
				log = new LogVO("B2");				
				log = setLog(odvo, log);
				logMapper.insertProcessLog(log);
								
				// 첫 구매 쿠폰 등록 / 쿠폰 발급 정보 업데이트
				CouponVO cpvo = new CouponVO("B", mIdx);
				int cpChk = couponMapper.issueChkCoupon(cpvo);
				
				if(cpChk == 0) {
					List<HashMap<String, Integer>> list = new ArrayList<>();
					List<CouponVO> cpList = couponMapper.selectCoupon(new CouponVO("B"));
					if(cpList != null && !cpList.isEmpty()) {
						for (CouponVO couponVO : cpList) {
							HashMap<String, Integer> mvo = new HashMap<>();
							mvo.put("m_idx", mIdx);
							mvo.put("c_idx", couponVO.getIdx());				
							list.add(mvo);								
						}

						couponMapper.insertCouponIssue(list);
						couponMapper.updateCouponCnt(list);						
					}
				}	
								
				HashMap<String, Integer> esti = new HashMap<>();
				esti.put("outCome", total);
				esti.put("oIdx", odvo.getIdx());
				
				// 예상지출 금액
				cashMapper.updateEstiCash(esti);
				
				// 캐시 입출력 프로시저
				cashMapper.increaseCash(csvo); 
				if(csvo.getOut() == 0) success = odvo.getIdx();
				
			}
		}
		
		return success;
	}

	public OrderVO selectOrderDetail(OrderVO odvo) throws Exception {
		return orderMapper.selectOrderDetail(odvo);
	}

	public int insertOrderAd(OrderVO odvo) throws Exception {
		int success = 0;
		PriceVO price = codeMapper.selectTotalPriceBefore(odvo);
		
		odvo.setBoxCnt(price.getBoxCnt());
		odvo.setTotalPrice(price.getPrPrice() + price.getAdPrice());
		odvo.setPdtUnit(price.getUnit());
		odvo.setPrintUnit(price.getPrUnit());
		odvo.setPrintPrice(price.getPrPrice());
		odvo.setState("A1");
		
		success = orderMapper.insertOrder(odvo);
		
		if(success > 0) {
			// 프로세스 이력에 로그 넣기			
			LogVO log = new LogVO("A1");
			log = setLog(odvo, log);
			logMapper.insertProcessLog(log);
			
			log = new LogVO("A2");		
			log = setLog(odvo, log);
			logMapper.insertProcessLog(log);	
		}
		
		return success;
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
		case "B10-1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "판매자 " + boxName + "님, 홍보 정보를 입력해주세요.", "Y", null, "B");
			lvo.setAction("CF");
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
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "박스애드에서 1차 인증사진을 반려하였습니다. 반려사유 확인 후 다시 등록해주세요.", "N", lvo.getMesg(), "B");
			lvo.setAction("II1R");			
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
	
	// 상태 변경 및 로그 입력
	public int updateState(OrderVO odvo, String logTypeArr, String mesg, HttpSession session) throws Exception {
		
		int success = orderMapper.updateOrder(odvo);
		
		if(success > 0) {
			if(odvo != null) {				
				odvo = orderMapper.selectOrderDetail(odvo);
				
				switch (odvo.getState()) {
				case "B2":
					// 광고 수수료
					PriceVO price = codeMapper.selectTotalPrice(odvo);
					
					// 구매승인 시 예상수입
					HashMap<String, Integer> esti = new HashMap<>();
					esti.put("inCome", price.getAdPrice() - price.getFee());
					esti.put("mIdx", ObjectUtil.getMember(session).getIdx());
					
					cashMapper.updateEstiCash(esti);		
					
					// 광고 승인 시 전단지 및 샘플 판별하여 로그 별도 입력
					BoxVO bvo = new BoxVO();
			    	bvo.setIdx(odvo.getbIdx());
					bvo = boxMapper.selectBoxDetail(bvo);
					
					if(bvo != null && bvo.getSecPro().equals("샘플")) {
						logTypeArr += ",B10";
					} else {
						logTypeArr += ",B4";
					}
					
					break;
				
				case "B7":
					// 구매 취소 시 금액 100% 환불
					CashVO csvo = new CashVO(odvo.getmIdx(), odvo.getIdx(), "P", "R", "박스 구매 취소로 인한 환불", odvo.getTotalPrice(), null);
					
					// 캐시 입출력 프로시저
					cashMapper.increaseCash(csvo);	
					break;	
				default:
					break;
				}
			}
			
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
			odvo = orderMapper.selectOrderDetail(odvo);				
							
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

	public List<LogVO> selectProcessLog(LogVO lvo) throws Exception {
		return logMapper.selectProcessLog(lvo);
	}

	public int adRequestCnt(int aIdx) throws Exception {
		return orderMapper.adRequestCnt(aIdx);
	}

	public MemberVO selectMarketingInfo(int writer) throws Exception {
		return orderMapper.selectMarketingInfo(writer);
	}

	public int insertFileNlog(HashMap<String, String> param, List<MultipartFile> file) throws Exception {
		
		List<FileVO> fileVOList = new ArrayList<FileVO>();
		
		OrderVO odvo = new OrderVO(Integer.parseInt(param.get("idx")));
		odvo.setState(param.get("state"));
		int success = orderMapper.updateOrder(odvo);
		
		// 프로세스 이력에 로그 넣기
		if(success > 0) {
			for (String type : param.get("logTypeArr").split(",")) {							
				LogVO lvo = new LogVO(type, null);	
				lvo = setLog(odvo, lvo);
				success = logMapper.insertProcessLog(lvo);			
				
				fileService.listSetting(lvo.getIdx(), type, file, fileVOList, "process");			
				fileService.insertFile(lvo.getIdx(), fileVOList);
			}			
		}
		
		return success;		
	}

}