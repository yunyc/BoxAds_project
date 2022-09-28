package com.boxads.main.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.box.mapper.CodeMapper;
import com.boxads.box.vo.CodeVO;
import com.boxads.common.mapper.MessageMapper;
import com.boxads.common.vo.MessageVO;
import com.boxads.main.mapper.CommonMapper;
import com.boxads.main.vo.FileVO;
import com.boxads.main.vo.MemberVO;


@Service
@Transactional
public class CommonService{
	
	@Resource private CommonMapper commonMapper;
	@Resource private CodeMapper codeMapper;
	@Resource private MessageMapper messageMapper;
	@Resource private FileService fileService;
	
	public int insertWish(Map<String, Object> param) throws Exception {
		return commonMapper.insertWish(param);
	}

	public int deleteWish(Map<String, Object> param) throws Exception {
		return commonMapper.deleteWish(param);
	}

	public List<CodeVO> selectCategory(CodeVO cvo) throws Exception {		
		return codeMapper.selectCodeList(cvo);
	}
	
	public void updateViewCnt(int idx, String table) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("table", table);
		map.put("idx", idx);
		commonMapper.updateViewCnt(map);
	}
	
	public void insertReason(HashMap<String, Object> param) throws Exception {
		commonMapper.insertReason(param);
	}
	
	public List<HashMap<String, Object>> selectReason(int parent, String type) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("parent", parent);
		map.put("type", type);
		
		return commonMapper.selectReason(map);
	}

	public HashMap<String, String> mainDashCnt() throws Exception {
		return commonMapper.mainDashCnt();
	}
	
	public HashMap<String, String> selectTest() throws Exception {
		return commonMapper.selectTest();
	}
	
	public List<HashMap<String, Object>> selectBannerAndAlarm(String type) throws Exception {
		return commonMapper.selectBannerAndAlarm(type);
	}
	
	public List<HashMap<String, Object>> selectAlarmLog(int mIdx, int end) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("mIdx", mIdx);
		map.put("end", end);
		return commonMapper.selectAlarmLog(map);
	}
	
	public HashMap<String, Object> selectQRcode(int parent) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("parent", parent);
		return commonMapper.selectQRcode(map);
	}

	public int selectMessageCnt(MessageVO mvo) throws Exception {
		return messageMapper.selectMessageCnt(mvo);
	}

	public List<MessageVO> selectMessageByWriter(MessageVO mvo) throws Exception {
		return messageMapper.selectMessageByWriter(mvo);
	}

	public MessageVO selectMemberForMesg(MessageVO mvo) throws Exception {
		return messageMapper.selectMemberForMesg(mvo);
	}

	public void insertMessage(MessageVO mvo, List<MultipartFile> uploadFile) throws Exception {
		messageMapper.insertMessage(mvo);
		
		if (uploadFile.size() > 0) {
    		insertFileList(mvo.getIdx(), uploadFile);
    	}
	}
	
	public void insertFileList(int parent, List<MultipartFile> uploadFile) throws Exception {
		List<FileVO> fileVOList = new ArrayList<FileVO>();
		
		fileService.listSetting(parent, "MG", uploadFile, fileVOList, "message");
		fileService.insertFile(parent, fileVOList);
	}

	public List<MessageVO> selectMessageList(MessageVO mvo) throws Exception {
		return messageMapper.selectMessageList(mvo);
	}

	public int selectMessageByWriterCnt(MessageVO mvo) throws Exception {
		return messageMapper.selectMessageByWriterCnt(mvo);
	}

	public List<MessageVO> selectInitMessage(MessageVO mvo) throws Exception {
		return messageMapper.selectInitMessage(mvo);
	}

	public void updateMessage(MessageVO mvo) throws Exception {
		messageMapper.updateMessage(mvo);
	}

	public HashMap<String, String> mainDashLoginCnt(MemberVO mem) throws Exception {		
		return commonMapper.mainDashLoginCnt(mem);
	}

	public int deleteMessage(HashMap<String, Object> param) throws Exception {
		messageMapper.deleteMessageFile(param);
		return messageMapper.deleteMessage(param);
	}

	public HashMap<String, Object> selectOrderMessageInfo(HashMap<String, Object> param) throws Exception {
		return messageMapper.selectOrderMessageInfo(param);
	}
	
	
}