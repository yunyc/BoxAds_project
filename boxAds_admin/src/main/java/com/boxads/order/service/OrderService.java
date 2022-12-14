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
		// ??????
		case "B1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + adName + "?????? ?????? ????????? ?????????????????????.", "N", null, "T");
			break;
		case "B2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + adName + "?????? ????????? ????????? ??????????????????.", "Y", null, "B");
			lvo.setAction("CF");
			break;
		case "B3":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "?????? ?????? ?????? ????????? ?????????????????????.", "N", null, "T");
			break;		
		case "B4":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + adName + "?????? ????????? ????????? ?????? ?????? ???????????????.", "N", null, "T");
			lvo.setPrintState(lvo.getType());
			lvo.setPrintContent("????????????");
			break;
		case "B5":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? ???????????? ????????? ????????? ?????????????????????.", "N", null, "T");
			lvo.setPrintState(lvo.getType());
			lvo.setPrintContent("????????? ??????");
			break;
		case "B6":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? ???????????? ????????? ????????? ?????????????????????.", "N", null, "T");
			lvo.setPrintState(lvo.getType());
			lvo.setPrintContent("????????? ??????");
			break;
		case "B7":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "???????????? ?????? ????????? ?????????????????????. (????????? ?????? ?????? 3??? ??????)", "N", null, "T");
			lvo.setPrintState(lvo.getType());
			lvo.setPrintContent("????????? ?????????");
			break;
		case "B8":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? ?????? ????????? ???????????? ????????? ?????? ????????????.", "N", null, "T");
			lvo.setPrintState(lvo.getType());
			lvo.setPrintContent("????????? ????????????");
			break;
		case "B9":
			String delivery = lvo.getDelivery();
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "????????? ?????? ???????????? ?????????????????????.", "Y", lvo.getMesg(), "T");
			lvo.setPrintState(lvo.getType());
			lvo.setPrintContent("?????? ??????");
			lvo.setDelivery(delivery);
			lvo.setAction("DV");
			break;
		case "B10":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + adName + "???, ?????? ????????? ?????? ????????? ??????????????????.", "Y", lvo.getMesg(), "A");
			lvo.setAction("DI");
			break;
		case "B11":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "????????? ?????? ???????????? ?????????????????????.", "Y", lvo.getMesg(), "T");			
			lvo.setAction("DV");
			break;
		case "B12-1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + adName + "??? ???????????? ?????? ????????? ??????????????????.", "N", null, "A");
			break;
		case "B12-2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + adName + "??? ???????????? ??????????????? ???????????? ??????????????????.", "N", null, "B");
			break;
		case "B13":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "???, ???????????? ???????????? ?????? 1??? ??????????????? ??????????????????. (?????? 2???)", "Y", null, "B");
			lvo.setAction("II1");
			break;
		case "B14":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "?????? 1??? ??????????????? ?????????????????????.", "Y", null, "T");
			lvo.setAction("IV1");
			break;
		case "B15-1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "?????????????????? 1??? ??????????????? ?????????????????????.", "N", null, "T");
			break;
		case "B15-2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "?????????????????? 1??? ??????????????? ?????????????????????. ???????????? ?????? ??? ?????? ??????????????????.", "Y", lvo.getMesg(), "B");
			lvo.setAction("II1R");
			
			lvo.setReasonState("O");
			lvo.setReasonType("F");
			break;
		case "B17-1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "?????? 1??? ??????????????? ??????????????? ??????????????????. ????????? ????????? ????????? ??????????????? ??????????????????.", "Y", null, "A");
			lvo.setAction("Q");
			break;
		case "B17-2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "???, 1??? ??????????????? ????????????????????????. ????????? ????????? ??????????????? ??????????????????.", "Y", null, "B");
			lvo.setAction("Q");
			break;
		case "B18":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "???, ???????????? ???????????? ?????? 2??? ??????????????? ??????????????????. (?????? 2???)", "Y", null, "B");
			lvo.setAction("II2");
			break;
		case "B19":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "?????? 2??? ??????????????? ?????????????????????.", "Y", null, "T");
			lvo.setAction("IV2");
			break;
		case "B20-1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "?????????????????? 2??? ??????????????? ?????????????????????.", "N", null, "T");
			break;
		case "B20-2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "?????????????????? 2??? ??????????????? ?????????????????????. ???????????? ?????? ??? ?????? ??????????????????.", "Y", lvo.getMesg(), "B");
			lvo.setAction("II2R");
			
			lvo.setReasonState("T");
			lvo.setReasonType("F");
			break;
		case "B21-1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "?????? 2??? ??????????????? ??????????????? ??????????????????. ????????? ????????? ????????? ??????????????? ??????????????????.", "Y", null, "A");
			lvo.setAction("Q");
			break;
		case "B21-2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "???, 2??? ??????????????? ????????????????????????. ????????? ????????? ??????????????? ??????????????????.", "Y", null, "B");
			lvo.setAction("Q");
			break;
		case "B22-1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + adName + "??? ???????????? ?????? ????????? ?????????????????????.\n?????????????????? ?????? ?????? ??? ?????? ??? ?????????????????? ?????? ???????????? ???????????? ???????????????.\n?????? ????????? ???????????? ???????????? ???????????? ??? ????????????.", "N", null, "A");			
			break;
		case "B22-2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + adName + "??? ???????????? ?????? ????????? ?????????????????????.\n?????????????????? ?????? ?????? ??? ?????????(??????)??? ???????????? ???????????????. ?????? ????????? ???????????? ???????????? ???????????? ??? ????????????.", "N", null, "B");
			break;
		case "B23":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + adName + "?????? ?????? ?????? ????????? ?????????????????????.", "N", null, "T");

			int printChk = logMapper.selectPrintLogChk(odvo.getIdx());
			
			// ?????? ??? ?????? ???????????? ?????? ??? ???????????? ??????
			if(printChk > 0){
				lvo.setPrintState("B0");
				lvo.setPrintContent("????????????");
			}
			
			break;
		case "B24":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "?????? ?????? ?????? ?????? ????????? ?????????????????????.", "Y", lvo.getMesg(), "T");
			lvo.setAction("MV");
			
			int printChk2 = logMapper.selectPrintLogChk(odvo.getIdx());
			
			// ?????? ??? ?????? ???????????? ?????? ??? ???????????? ??????
			if(printChk2 > 0){
				lvo.setPrintState("B0");
				lvo.setPrintContent("????????????");
			}
			
			break;
			
		// ??????
		case "A1":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "?????? ?????? ????????? ?????????????????????.", "N", null, "T");
			break;
		case "A2":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "?????? ?????? ?????? ????????? ????????? ?????? \"?????????\" ??????????????????.", "Y", null, "A");
			lvo.setAction("CF");
			break;
		case "A3":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + adName + "?????? ?????? ?????? ????????? \"?????????\" ?????????????????????.", "N", null, "T");
			break;
		case "A4":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + adName + "???, ?????? ?????? ?????? ????????? ???????????????.\n????????? ?????? ?????? ????????? ?????? ??? ??? ?????? ????????? ?????? ??????, ??????????????? ?????? ??????????????????.", "Y", null, "A");
			lvo.setAction("BUY");
			break;
		case "A5":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + adName + "?????? ?????? ?????? ?????? ????????? ?????????????????????.", "N", null, "T");
			break;
		case "A6":
			lvo = new LogVO(odvo.getIdx(), lvo.getType(), "????????? " + boxName + "?????? ?????? ?????? ????????? ?????????????????????.", "N", null, "T");
			break;
		default:
			break;
		}		
		
		return lvo;
	}	
	

	public int updateState(OrderVO odvo, String logTypeArr, @RequestParam String mesg) throws Exception {
		
		int success = orderMapper.updateOrder(odvo);
		
		if(success > 0) {			
			
			// ???????????? ????????? ?????? ??????
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
	
	// ?????? ??????
	public int insertProcessLog(OrderVO odvo, String logTypeArr, String mesg, String delivery) throws Exception {
		
		int success = 0;
		
		if(odvo.getIdx() > 0) {
							
			// ???????????? ????????? ?????? ??????
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
		
		// ???????????? ????????? ?????? ??????
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