package com.boxads.main.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.ss.formula.ptg.MemErrPtg;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.ad.service.AdService;
import com.boxads.ad.vo.AdVO;
import com.boxads.box.service.BoxService;
import com.boxads.box.vo.BoxVO;
import com.boxads.common.service.MailService;
import com.boxads.common.vo.MessageVO;
import com.boxads.main.ObjectUtil;
import com.boxads.main.service.BoardService;
import com.boxads.main.service.CommonService;
import com.boxads.main.service.FileService;
import com.boxads.main.service.MemberService;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;
import com.boxads.main.vo.MemberVO;


@Controller
@RequestMapping(value="/member")
public class MemberController {

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	// 프로필 이미지 타입
	private static final String profileType = "P";
	// 사업자 이미지 타입
	private static final String fileType = "C";
	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;
	@Resource private MemberService memberService;
	@Resource private FileService fileService;
	@Resource private MailService mailService;
	@Resource private BoxService boxService;
	@Resource private AdService adService;
	@Resource private CommonService commonService;
	
	// 계정 관리 페이지 이동
    @RequestMapping(value = "/profile")
    public String profileInit(HttpSession session, Model model) throws Exception {
    	log.info("profileInit메서드 시작");
    	MemberVO memberVO = (MemberVO) session.getAttribute("login");
    	List<FileVO> imgList = fileService.selectFileList(0, memberVO.getIdx(), profileType);
    	List<FileVO> busyList = fileService.selectFileList(0, memberVO.getIdx(), fileType);
    	
    	model.addAttribute("memberVO", memberVO);
    	model.addAttribute("imgList", imgList);
    	model.addAttribute("busyList", busyList);
    	
    	return "mypage/profile_edit";
    }
    
    // 계정 관리 페이지 수정 처리
    @RequestMapping(value = "/profile", method = RequestMethod.POST)
    public String profile(@ModelAttribute MemberVO memberVO, 
    						@RequestParam(required = false) List<MultipartFile> uploadImage,
    						@RequestParam(required = false) List<MultipartFile> uploadFile,
    						@RequestParam(required = false) int[] fileIdx,
    						@RequestParam(required = false) int[] deleteIdx,
    						HttpSession session,
    						Model model) throws Exception {
    	
    	log.info("profile메서드 시작");
    	// 사업자 재인증시 미인증 상태로 변경
    	if (memberVO.getConfirmFlag() != null) {
    		memberVO.setConfirmFlag("N");
    	}
    	memberService.updateInfo(memberVO, session, uploadImage, uploadFile, fileIdx, deleteIdx);
    	
    	if (uploadImage.get(0).getSize() > 0) {
			// 프로필 이미지 세션 저장
			HashMap<String, String> img = memberService.selectPrImg(memberVO);
			session.setAttribute("prImg", img);	
		}
    	
    	model.addAttribute("alertMsg", "저장되었습니다.");
    	model.addAttribute("redirectUrl", "/member/profile");
    	return "common/alert";
    }
    
    // 탈퇴하기 페이지 이동
    @RequestMapping(value = "/quit")
    public String quitInit() throws Exception {
    	log.info("quitInit메서드 시작");
    	return "mypage/member_quit";
    }
    
    // 탈퇴하기
    @RequestMapping(value = "/quit", method = RequestMethod.POST)
    public String quit(@RequestParam String quitMsg, HttpSession session, Model model) throws Exception {
    	log.info("quit메서드 시작");
    	
    	MemberVO memberVO = (MemberVO) session.getAttribute("login");
    	
    	// 진행중인 상품 및 주문 건 체크 후 탈퇴 처리
    	if(memberService.selectChkQuit(memberVO.getIdx()) > 0) {
    		String mesg = "진행중인 상품이나 거래가 있습니다.";
    		
			/*
			 * if(chkData.get("adChk") > 0) { mesg = "마켓에 광고중(애드)인 상품이 있습니다."; } else
			 * if(chkData.get("boxChk") > 0) { mesg = "마켓에 판매중(박스)인 상품이 있습니다."; } else
			 * if(chkData.get("oChk") > 0) { mesg = "진행중인 거래가 있습니다."; }
			 */
    		
    		model.addAttribute("alertMsg", mesg);
    		
    	} else {
    		memberVO.setState("N");
    		memberVO.setQuitMsg(quitMsg);
    		memberService.updateMemberList(session, memberVO);
    		
    		Map<String, String> data = BeanUtils.describe(memberVO);
    		mailService.sendMail(data, "withdraw");
    		
    		model.addAttribute("alertMsg", "회원 탈퇴가 완료되었습니다.");
    		model.addAttribute("redirectUrl", "redirect:/login/logout");    		
    	}
    	
    	
    	return "common/alert";
    }
    
    // 찜리스트 조회
    @RequestMapping(value = "/wish_list")
    public String wishListInit(BoxVO bvo, AdVO advo, Model model, HttpSession session) throws Exception {
    	log.info("wishListInit메서드 시작");
    	
    	// 박스 total
    	bvo.setState("Y");
    	bvo.setFavFlag("Y");
    	Long cnt = boxService.selectBoxCnt(bvo);
    	model.addAttribute("bxTotal", cnt);

    	// 애드 total
    	advo.setState("Y");
    	advo.setFavFlag("Y");
    	cnt = adService.selectAdCnt(advo);
    	model.addAttribute("adTotal", cnt);
    
    	return "mypage/wish_list";
    }
    
    // 메세지 리스트 조회
    @RequestMapping(value = "/message")
    public String messageInit(MessageVO mvo, Model model, HttpSession session) throws Exception {
    	log.info("messageInit메서드 시작");
    	
    	mvo.setWriter(ObjectUtil.getMember(session).getIdx());
    	int cnt = commonService.selectMessageCnt(mvo);
    	model.addAttribute("total", cnt);
    
    	return "mypage/message";
    }
    
    // 메세지 리스트
    @RequestMapping(value = "/messageAjaxList")
    public String messageAjaxList(MessageVO mvo, Model model, HttpSession session) throws Exception {
    	log.info("messageInit메서드 시작");
    	
    	mvo.setWriter(ObjectUtil.getMember(session).getIdx());
    	List<MessageVO> list = commonService.selectMessageList(mvo);
    	model.addAttribute("list", list);
    	
    	return "list/message_list";
    }
    
    // 메세지 리스트
    @RequestMapping(value = "/message_detail")
    public String messageDetail(HttpServletRequest request, MessageVO mvo, Model model, HttpSession session) throws Exception {
    	log.info("messageInit메서드 시작");
    	
    	if (!ObjectUtil.refererChk(request)) return null;
    	
    	String rtUrl = "";
    	int mIdx = ObjectUtil.getMember(session).getIdx();

    	// 본인에게 메시지 발송 불가
    	if(mIdx == mvo.getReceiver()) {
    		model.addAttribute("alertMsg", "회원님 본인에게 메시지를 보낼 수는 없습니다.");
        	rtUrl = "common/alert";
    	} else {    		
    		mvo.setWriter(mIdx);
    		
    		// 메세지 읽음 처리
    		commonService.updateMessage(mvo);
    		
    		// total
    		int total = commonService.selectMessageByWriterCnt(mvo);
    		
    		// 메세지 대상 정보
    		mvo = commonService.selectMemberForMesg(mvo);
    		
    		model.addAttribute("total", total);
    		model.addAttribute("receiver", mvo);
    		
    		rtUrl = "message/message_detail";
    	}    	
    	
    	return rtUrl;
    }
    
    // 메세지 리스트
    @RequestMapping(value = "/messageDetailAjaxList")
    public String messageDetailList(HttpServletRequest request, MessageVO mvo, Model model, HttpSession session) throws Exception {
    	log.info("messageInit메서드 시작");
    	
    	if (!ObjectUtil.refererChk(request)) return null;
    	
    	mvo.setWriter(ObjectUtil.getMember(session).getIdx());
    	
    	// 메시지
    	List<MessageVO> list = commonService.selectMessageByWriter(mvo);
    	
    	// 메세지 대상 정보
    	mvo = commonService.selectMemberForMesg(mvo);
    	
    	model.addAttribute("list", list);
    	model.addAttribute("receiver", mvo);
    	
    	return "list/message_detail_list";
    }
    
    // 메세지 작성
    @RequestMapping(value = "/message_detail", method = RequestMethod.POST)
    @ResponseBody
    public String messageWrite(MessageVO mvo, @RequestParam(required=false) List<MultipartFile> uploadFile, HttpSession session) throws Exception {
    	log.info("qnaWrite메서드 시작");
    	
    	mvo.setWriter(ObjectUtil.getMember(session).getIdx());
    	commonService.insertMessage(mvo, uploadFile);
    	
    	return "?writer="+mvo.getWriter()+"&receiver="+mvo.getReceiver();
    }
}
