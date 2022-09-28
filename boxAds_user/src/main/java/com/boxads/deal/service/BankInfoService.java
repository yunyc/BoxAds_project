package com.boxads.deal.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.deal.mapper.BankInfoMapper;
import com.boxads.deal.mapper.BillMapper;
import com.boxads.deal.vo.BankInfoVO;
import com.boxads.deal.vo.BillVO;
import com.boxads.main.service.FileService;
import com.boxads.main.vo.FileVO;
import com.boxads.main.vo.MemberVO;


@Transactional
@Service
public class BankInfoService {
	
	@Resource MessageSource msg;
	
	@Resource private BankInfoMapper bankInfoMapper;
	@Resource private FileService fileService;
	
	private static final Logger log = LoggerFactory.getLogger(BankInfoService.class);
	private static final String path = "deal";
	
	public BankInfoVO selectBankInfo(BankInfoVO bivo) throws Exception {
		return bankInfoMapper.selectBankInfo(bivo);
	}
	
	public Map<String, Object> selectBankInfoWithFile(Map<String, Object> paramMap) throws Exception {
		return bankInfoMapper.selectBankInfoWithFile(paramMap);
	}

	public void insertBankInfo(HttpSession session, Model model, Locale locale, 
							   BankInfoVO bivo, List<MultipartFile> bankbook, int[] fileIdx, int[] deleteIdx) throws Exception {
		//validate
		log.info("들어온 bivo : " + bivo);
        log.info("bankbook : " + bankbook);
        log.info("fileIdx.length : " + fileIdx.length);
        log.info("deleteIdx.length : " + deleteIdx.length);
        if(bivo.getBank() == null || bivo.getBank().equals("")) {
    		log.info("거래은행 없음");
    		model.addAttribute("alertMsg", msg.getMessage("bankinfo.write.bank", null, locale));
    		model.addAttribute("redirectUrl", "/deal/deal_withdraw");
    		return;
    	}
    	else if(bivo.getAccNumber() == null || bivo.getAccNumber().equals("")) {
    		log.info("계좌번호 없음");
    		model.addAttribute("alertMsg", msg.getMessage("bankinfo.write.accNumber", null, locale));
    		model.addAttribute("redirectUrl", "/deal/deal_withdraw");
    		return;
    	}
    	else if(bivo.getDepositor() == null || bivo.getDepositor().equals("")) {
    		log.info("예금주 명 없음");
    		model.addAttribute("alertMsg", msg.getMessage("bankinfo.write.depositor", null, locale));
    		model.addAttribute("redirectUrl", "/deal/deal_withdraw");
    		return;
    	}
    	else if((bankbook == null || bankbook.size() <= 0 || bankbook.get(0) == null) && (fileIdx == null || fileIdx[0] == 0)) {
    		log.info("사업자 통장 사본 없음");
    		model.addAttribute("alertMsg", msg.getMessage("bankinfo.write.bankbook", null, locale));
    		model.addAttribute("redirectUrl", "/deal/deal_withdraw");
    		return;
    	}
		
		//원래꺼 찾기
        int mIdx = ((MemberVO)session.getAttribute("login")).getIdx();
        BankInfoVO tBIVO = new BankInfoVO();
        tBIVO.setmIdx(mIdx);
        tBIVO = selectBankInfo(tBIVO);
        if(tBIVO == null || tBIVO.getIdx() == 0) {
        	tBIVO = new BankInfoVO();
        } else {
        	Map<String, Object> paramMap = new HashMap<String, Object>();
        	paramMap.put("mIdx", mIdx);
        	Map<String, Object> bankInfoAndFile = bankInfoMapper.selectBankInfoWithFile(paramMap);
        	//삭제된 파일 있고, 조작된 삭제파일(html 수정)이 아니면 삭제
        	if(deleteIdx != null && deleteIdx[0] == (int)bankInfoAndFile.get("fileIdx")) {
        		fileService.setDeleteIdx(deleteIdx);
        	}
        }
        
        //찾은거에 입력받은거 처리 (원래꺼가 있으면 BankInfoVO.idx가 살아있어서 ON DUPLICATE로 빠질꺼고, 없으면 BankInfoVO.idx에 0이 들어가서 insert가 되)
        tBIVO.setmIdx(mIdx);
    	tBIVO.setBank(bivo.getBank());
    	tBIVO.setAccNumber(bivo.getAccNumber());
    	tBIVO.setDepositor(bivo.getDepositor());
    	
    	//수정or저장
    	int r = bankInfoMapper.insertBankInfo(tBIVO);

        //파일 입력
    	List<FileVO> fileVOList = new ArrayList<FileVO>();
    	if(bankbook.get(0).getSize() > 0) {
    		FileVO file = fileService.listSet(tBIVO.getIdx(), "CB", bankbook, "deal");
    		file.setIdx(fileIdx[0]);
    		fileVOList.add(file);
    	}
    	if (fileVOList.size() > 0) {
    		//새로 입력된 파일이 있으면 원래 있던 파일을 찾아봄
    		Map<String, Object> paramMap = new HashMap<String, Object>();
    		if(tBIVO.getIdx() == 0) {
    			paramMap.put("mIdx", mIdx);
    		} else {
    			paramMap.put("idx", tBIVO.getIdx());
    		}
    		Map<String, Object> bankInfoAndFile = bankInfoMapper.selectBankInfoWithFile(paramMap);
    		log.info("bankInfoAndFile : "+bankInfoAndFile);
    		//원래 있던 파일이 있으면 삭제함
    		if(bankInfoAndFile != null) {
	    		int originFileIdx = (int)bankInfoAndFile.get("fileIdx");
	    		deleteIdx[0] = originFileIdx;
	    		fileService.setDeleteIdx(deleteIdx);
    		}
    		
    		//새로 입력되 파일 입력
			fileService.insertFile(tBIVO.getIdx(), fileVOList);
		}
    	
    	//결과 반환
    	if(r > 0) {
    		model.addAttribute("alertMsg", msg.getMessage("bankinfo.write.submit", null, locale));
    		model.addAttribute("redirectUrl", "/deal/deal_withdraw");
    	} else {
    		model.addAttribute("alertMsg", msg.getMessage("bankinfo.write.error", null, locale));
    		model.addAttribute("redirectUrl", "/deal/deal_withdraw");
    	}
	}
}