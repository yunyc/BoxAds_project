package com.boxads.setting.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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

import com.boxads.common.vo.PageVO;
import com.boxads.main.ObjectUtil;
import com.boxads.main.service.CommonService;
import com.boxads.setting.service.SettingService;
import com.boxads.setting.vo.CodeVO;
import com.boxads.setting.vo.FeesVO;
import com.boxads.setting.vo.UnitVO;
import com.boxads.main.vo.AdminVO;


@Controller
@RequestMapping(value = "/setting")
public class SettingController {
	@Resource private SettingService sservice;
	@Resource private CommonService cservice;	

	private static final Logger log = LoggerFactory.getLogger(SettingController.class);
	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;	

	// 1차 코드 리스트 type P / C / F
	@RequestMapping(value = "/code_list")
    public String code(CodeVO cvo, Model model) throws Exception{		
        return "setting/code_list";
    }
	
	// 하위 코드 테이블 ajax
	@RequestMapping(value = "/code_call")
    public String codeCall(CodeVO cvo, Model model) throws Exception{	
		List<CodeVO> list = sservice.selectCodeList(cvo);		
		model.addAttribute("codeList", list);
        return "setting/code_list_append";
    }
	
	// 코드 상세
	@RequestMapping(value = "/code_write")
    public String codeWrite(CodeVO cvo, Model model) throws Exception{	
		List<CodeVO> code = null;
		
		// detail		
		if(cvo.getIdx() > 0) {
			code = sservice.selectCodeList(cvo);
			cvo = code.get(0);
		}		

		// parent info
		Map<String, String> map = sservice.selectCodeName(cvo);
		
		model.addAttribute("code", cvo);
		model.addAttribute("codeName", map);
		
        return "setting/code_write";
    }
	
	// 코드 등록
	@RequestMapping(value = "/code_write", method = RequestMethod.POST)
    public String codeWritePost(CodeVO cvo, Model model, HttpSession session) throws Exception{		
		cvo.setWriter(getAdmin(session).getIdx());
		int success = sservice.insertCode(cvo);
    	
		if(success == 0) {
    		model.addAttribute("alertMsg","등록을 실패했습니다.");
		}else {
			model.addAttribute("alertMsg","등록 되었습니다.");		
			model.addAttribute("redirectUrl","/setting/code_list?type="+cvo.getType());
		}
		
		return "common/alert";
    }
	
	// 순서 저장
	@RequestMapping(value = "/code_sort", method = RequestMethod.POST)
    public String codeSort(@RequestParam Map<String, String> param, Model model) throws Exception{
		List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		int success = 0;
		
		if(param.get("sortArr") != null) {
			String[] sort = param.get("sortArr").split(",");
			String[] idx = param.get("idxArr").split(",");
			
			for(int i=0; i<sort.length; i++) {
				HashMap<String, String> temp = new HashMap<>();				
				temp.put("sort", sort[i]);
				temp.put("idx", idx[i]);
				
				list.add(temp);
			}
			success = sservice.insertCodeSort(list);
		}
		
		if(success == 0) {
    		model.addAttribute("alertMsg","등록을 실패했습니다.");
		}else {
			model.addAttribute("alertMsg","등록 되었습니다.");		
		}
		
		return "common/alert";
    }
	
	// 단가관리 리스트
	@RequestMapping(value = "/unit_list")
	public String unit(CodeVO cvo, Model model) throws Exception{
		int idx = 0;

		// code name list
		cvo.setDepth(2);
		cvo.setType("P");
		
		List<HashMap<String, Object>> list = sservice.selectForUnit(cvo);		
		if(!list.isEmpty()) {
			idx = cvo.getIdx() > 0 ? cvo.getIdx() : Math.toIntExact((long) list.get(0).get("idx"));			
		}
		
		// 해당 idx의 단가 list
		List<UnitVO> list2 = sservice.selectUnit(idx);
		
		model.addAttribute("unitList", list2);
		model.addAttribute("nameList", list);
		model.addAttribute("idx", idx);
		
		return "setting/unit_list";
	}
		
	// 단가저장
	@RequestMapping(value = "/unit_list", method = RequestMethod.POST)
    public String unitPost(@ModelAttribute UnitVO paramUvo, @RequestParam(required = false) int[] delArr, Model model, HttpSession session) throws Exception{
		List<UnitVO> list = new ArrayList<>();
		boolean chkFlag = true;
		int success = 0;
		String msg = null;

		int[] min = paramUvo.getMinArr();
		int[] max = paramUvo.getMaxArr();
				
		// 한번 더 체크
		for(int i = 0; i < max.length; i++) {
			if(min[i] > max[i]) {
				msg = "최소값이 더 큽니다.";
				chkFlag = false;
				break;
			} else {
				for(int j = 0; j < min.length; j++) {
					if(i != j) {
						if(max[i] <= max[j] && max[i] >= min[j] || min[i] <= max[j] && min[i] >= min[j]) {						
							msg = "인쇄구간이 중복됩니다.";
							chkFlag = false;
							break;
						} 
					}
				}
			}
			
			if(chkFlag){
				int writer = ObjectUtil.getAdmin(session).getIdx();
								
				UnitVO uvo = new UnitVO();
				uvo.setcIdx(paramUvo.getcIdx());
				uvo.setWriter(writer);
				uvo.setType(paramUvo.getType());
				
				uvo.setIdx(paramUvo.getIdxArr()[i]);
				uvo.setuCode(paramUvo.getuCodeArr()[i]);
				uvo.setMin(paramUvo.getMinArr()[i]);
				uvo.setMax(paramUvo.getMaxArr()[i]);
				uvo.setOneSide(paramUvo.getOneSideArr()[i]);
				uvo.setTwoSide(paramUvo.getTwoSideArr()[i]);
									
				list.add(uvo);	
			}
		}
				
		if(chkFlag){			
			success = sservice.insertUnit(list, Arrays.stream(delArr).boxed().collect(Collectors.toList()));			
			if(success > 0) {
				msg = "등록 되었습니다.";
			}else {
				msg = "등록을 실패했습니다.";
			}
		}
		
		model.addAttribute("redirectUrl","/setting/unit_list?idx="+paramUvo.getcIdx());
		model.addAttribute("alertMsg", msg);
		return "common/alert";
	}
	
	// 수수료 리스트
	@RequestMapping(value = "/fees_list")
    public String fees(FeesVO fvo, Model model) throws Exception{
		List<FeesVO> list = sservice.selectFeesList(fvo);
		
		model.addAttribute("feesList", list);
        return "setting/fees_list";
    }
	
	// 수수료 저장
	@RequestMapping(value = "/fees_insert", method = RequestMethod.POST)
	public String feesInsert(@RequestParam Map<String, String> param, Model model, HttpSession session) throws Exception{		
		List<FeesVO> list = new ArrayList<FeesVO>();
		int success = 0;

		if(param.get("perArr") != null) {
			String[] per = param.get("perArr").split(",");
			String[] idx = param.get("idxArr").split(",");
			String[] cate = param.get("cateArr").split(",");

			for(int i=0; i<per.length; i++) {
				FeesVO fvo = new FeesVO();			
				fvo.setPer(Integer.parseInt(per[i]));
				fvo.setIdx(idx[i] != null ? Integer.parseInt(idx[i]) : 0);
				fvo.setCategory(cate[i]);

				fvo.setWriter(ObjectUtil.getAdmin(session).getIdx());
				fvo.setType("B");

				list.add(fvo);
			}
			success = sservice.insertFees(list);		
		}		
		
		if(success == 0) {
    		model.addAttribute("alertMsg","등록을 실패했습니다.");
		}else {
			model.addAttribute("alertMsg","등록 되었습니다.");
		}
		
        return "common/alert";
    }	

	// 관리자 리스트
	@RequestMapping(value = "/admin_list")
    public String adminList(AdminVO avo, PageVO pvo, Model model) throws Exception{
		
		avo.setStart(pvo.getStart());
		avo.setEnd(pvo.getEnd());
		
		List<AdminVO> list = sservice.selectAdminList(avo);
		pvo.setTotalCnt(sservice.selectAdminCnt(avo));
		
		model.addAttribute("adminList", list);
		model.addAttribute("page", pvo);
		
        return "setting/admin_list";
    }
	
	// 관리자 등록 페이지
	@RequestMapping(value = "/admin_write")
    public String admin(AdminVO avo, Model model) throws Exception{
		List<AdminVO> admin = null;
		
		// detail		
		if (avo.getIdx() > 0) {
			admin = sservice.selectAdminList(avo);
			avo = admin.get(0);
		} 

		model.addAttribute("admin", avo);
        return "setting/admin_write";
    }
	
	// 관리자 id 중복체크
//	@RequestMapping(value="/adminIdChk", method = RequestMethod.POST)
//	@ResponseBody
//	public int adminIdChk(AdminVO avo) throws Exception {
//		int cnt = sservice.adminIdChk(avo);		
//		
//		return cnt;
//	}
	
	// 관리자 등록
	@RequestMapping(value = "/admin_insert", method = RequestMethod.POST)
    public String adminInsert(@ModelAttribute AdminVO avo, Model model) throws Exception{
		
		int success = 0;
		// 관리자 비밀번호 암호화/복호화 여부 묻고 작업 해두기 
		if(avo.getPw() != null) {
			avo.setPw(spe.encodePassword(avo.getPw(), null));
		}

		int cnt = sservice.adminIdChk(avo);		

		if(cnt == 0) {
			if (avo.getIdx() > 0) {
				success = sservice.updateAdminList(avo);
				model.addAttribute("redirectUrl","/setting/admin_write?idx=" + avo.getIdx());
			} else {
				success = sservice.insertAdmin(avo);
				model.addAttribute("redirectUrl","/setting/admin_list");
			}

			if(success == 0) {
				model.addAttribute("alertMsg","등록을 실패했습니다.");
				model.addAttribute("redirectUrl", null);
				
			} else {
				model.addAttribute("alertMsg","등록 되었습니다.");						
			}

		} else {
			model.addAttribute("alertMsg","이미 등록된 아이디 입니다.");
		}	
		
		return "common/alert";
    }
	
	
	private AdminVO getAdmin(HttpSession session) {
		AdminVO avo = (AdminVO)session.getAttribute("login");
		return avo;  		
  	}
}
