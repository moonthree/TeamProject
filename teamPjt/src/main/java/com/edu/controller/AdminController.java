package com.edu.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.edu.service.AdminService;
import com.edu.service.MessageService;
import com.edu.service.MypageService;
import com.edu.service.StoreService;
import com.edu.service.fundingMainService;
import com.edu.vo.FundingInfoDetailVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.MemberVO;
import com.edu.vo.PageMaker;
import com.edu.vo.PageMaker2;
import com.edu.vo.Pagination;
import com.edu.vo.Pagination2;
import com.edu.vo.StoreInfoDetailVO;
import com.edu.vo.StoreVO;
import com.edu.vo.ZzimInfoVO;

// 주석 version13 

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private fundingMainService fundingMainService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping(value = "/approval.do")
	public String approval(Model model,Pagination page1, Pagination2 page2) {
		
		//펀딩 신청한 제품 목록 가져오기
		model.addAttribute("listFun", adminService.list_funding(page1));
		
		PageMaker pageMaker_One = new PageMaker();
		pageMaker_One.setPage(page1);
		pageMaker_One.setTotalCount(adminService.funding_Count());
		model.addAttribute("pageOne", pageMaker_One);
		
		//스토어 신청한 제품 목록 가져오기 
		model.addAttribute("listStore", adminService.list_store(page2));
		PageMaker2 pageMaker_Two = new PageMaker2();
		pageMaker_Two.setPage(page2);
		pageMaker_Two.setTotalCount(adminService.store_Count());
		model.addAttribute("pageTwo", pageMaker_Two);
		
		return "mypage/approval";
	}

	@RequestMapping(value = "/management_product.do")
	public String management_product(Model model,Pagination page1, Pagination2 page2) {
		
		model.addAttribute("listFun",adminService.pro_funding(page1));
		PageMaker pageMaker_One = new PageMaker();
		pageMaker_One.setPage(page1);
		pageMaker_One.setTotalCount(adminService.pro_FundingCount());
		model.addAttribute("pageOne", pageMaker_One);
		
		
		//스토어 신청한 제품 목록 가져오기 
		model.addAttribute("listStore", adminService.pro_store(page2));
		PageMaker2 pageMaker_Two = new PageMaker2();
		pageMaker_Two.setPage(page2);
		pageMaker_Two.setTotalCount(adminService.store_Count());
		model.addAttribute("pageTwo", pageMaker_Two);	
		
		
		return "mypage/management_product";
	}
	
	
	
	
	

	@RequestMapping(value = "/management_member.do")
	public String management_member(Model model ,Pagination page1, Pagination2 page2) {
		
			
			
			model.addAttribute("seller", adminService.memberList_sell(page1));
			PageMaker pageMaker_sell = new PageMaker();
			pageMaker_sell.setPage(page1);
			pageMaker_sell.setTotalCount(adminService.count_seller());
			model.addAttribute("pageMaker_sell", pageMaker_sell);
			
			model.addAttribute("company", adminService.memberList_company(page2));
			PageMaker2 pageMaker_company = new PageMaker2();
			pageMaker_company.setPage(page2);
			pageMaker_company.setTotalCount(adminService.count_company());
			model.addAttribute("pageMaker_company", pageMaker_company);
			 
		
		return "mypage/management_member";
	}
	
	
	//펀딩 제품 상태 변경하기 위한 ajax 컨트롤러 -> 승인 허용
	@RequestMapping(value = "/update_FundingState.do")
	@ResponseBody
	public int updateFundingState(int f_idx) {
		
		// update 쿼리문
		int result = adminService.update_funding(f_idx);
		
		// funding 신청한 사람의  member_idx를 가져오기
	    int member_idx = messageService.getMemberIdx(f_idx);  
	    // message 테이블에 로그 남기기 insert
	    Map<String, Object> param = new HashMap<String, Object>();
	    
	    param.put("from_member_idx", 0);
	    param.put("to_member_idx", member_idx);
	    param.put("funding_idx", f_idx);
	    param.put("f_or_s", 0);
	    
	    //펀딩 제목 가져오기
	    String fundingTitle = fundingMainService.select_fundingOne(f_idx).getFunding_title();
	    param.put("message_content", "<span style=\"color:#fa6463\" >"+fundingTitle+"</span> 펀딩이 승인되었습니다.<br> 지금 확인해보세요");
	    messageService.insertLog(param);
		
		return result;
	}
	
	//펀딩 제품 상태 거절하기 위한 ajax 컨트롤러 -> 승인 거절
		@RequestMapping(value = "/update_FundingState2.do")
		@ResponseBody
		public int updateFundingState2(int f_idx) {
			
			// update 쿼리문
			int result = adminService.update_funding2(f_idx);
			return result;
		}
		
	
		//스토어 제품 상태 변경하기 위한 ajax 컨트롤러 -> 승인 허용
		@RequestMapping(value = "/update_StoreState.do")
		@ResponseBody
		public int updateStoreState(int store_idx) throws Exception {
			
			// update 쿼리문
			int result = adminService.update_store(store_idx);
			
			// store 신청한 사람의  member_idx와 title가져오기
			StoreVO storeVO = storeService.read(store_idx,0);
		    int member_idx = storeVO.getMember_idx();
		    String store_title = storeVO.getStore_title();
		    
		    // message 테이블에 로그 남기기 insert
		    Map<String, Object> param = new HashMap<String, Object>();
		    
		    param.put("from_member_idx", 0);
		    param.put("to_member_idx", member_idx);
		    param.put("store_idx", store_idx);
		    param.put("f_or_s", 1);
		    param.put("message_content", "<span style=\"color:#fa6463\" >"+store_title+"</span> 스토어가 승인되었습니다.<br> 지금 확인해보세요");
		    messageService.insertLog(param);
			
			return result;
		}
		
		//스토어 제품 상태 거절하기 위한 ajax 컨트롤러 -> 스토어 승인 거절
			@RequestMapping(value = "/update_StoreState2.do")
			@ResponseBody
			public int updateStoreState2(int store_idx) {
				
				// update 쿼리문
				int result = adminService.update_store2(store_idx);
				return result;
			}
			//관리자용 mypage
			@RequestMapping(value = "/mypage.do",method = RequestMethod.GET)
			public String mypage_admin(Model model,int member_idx) {
				// 세션에 있는 사용자의 정보 가져옴
				
				MemberVO admin = new MemberVO();
				System.out.println(member_idx);
				admin.setMember_idx(member_idx);
			
				
				MemberVO member = mypageService.selectOne(admin);
				
				System.out.println(member.toString());
				model.addAttribute("member", member);
				
				
				
				//펀딩리스트 3개씩 & 펀딩 개수
				//s3f에  member_idx에 따른 funding_order_idx도 가져올 수 있어야함
				List<FundingInfoDetailVO> s3f = mypageService.select3Funding(admin.getMember_idx());
				
				model.addAttribute("select3Funding",s3f);
				model.addAttribute("countFunding",mypageService.countFunding(admin.getMember_idx()));
				
				//스토어리스트 3개씩 & 스토어 개수
				List<StoreInfoDetailVO> s3s = mypageService.select3Store(admin.getMember_idx());
				model.addAttribute("select3Store",s3s);
				model.addAttribute("countStore",mypageService.countStore(admin.getMember_idx()));
				
				//찜리스트 3개씩 & 찜 개수
//				List<ZzimVO> s3z = mypageService.select3Zzim(login.getMember_idx());
//				model.addAttribute("select3Zzim",s3z);
				//찜리스트
				List<ZzimInfoVO> zzim_category = mypageService.getZzim_category(admin.getMember_idx());
				List<ZzimInfoVO> allZzimInfo = new ArrayList<ZzimInfoVO>();
				for(int i=0 ; i<zzim_category.size() ; i++) {
					//찜 카테고리와 member_idx를 통해 뽑아와야함 그리고 다시 합치기
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("zzim_category", zzim_category.get(i).getZzim_category());
					param.put("member_idx", admin.getMember_idx());
					param.put("zzim_idx", zzim_category.get(i).getZzim_idx());
					
					ZzimInfoVO mzl2 = mypageService.myZzimList2(param);
					allZzimInfo.add(mzl2);
				}
				model.addAttribute("myZzimList",allZzimInfo);
				model.addAttribute("countZzim",mypageService.countZzim(admin.getMember_idx()));
				
				return "admin/admin_mypage";
			}
			
		
			@RequestMapping(value = "/my_info.do",method = RequestMethod.GET)
			public String admin_my_info(Model model,int curridx) {
				
				
				MemberVO admin = new MemberVO();
				admin.setMember_idx(curridx);
				MemberVO member = mypageService.selectOne(admin);
				model.addAttribute("member", member);
				
				// 펀딩리스트4개씩
				List<FundingInfoDetailVO> s4f = mypageService.select4Funding(admin.getMember_idx());
				model.addAttribute("select4Funding",s4f);
				
				
				// 스토어 리스트4개씩
				List<StoreInfoDetailVO> s4S = mypageService.select4Store(admin.getMember_idx());
				model.addAttribute("select4Store",s4S);
				
				return "admin/admin_my_info";
			}
			
			
			@RequestMapping(value = "/info_funding.do")
			public String info_funding(Model model, int curridx) {
				// 세션에 있는 사용자의 정보를 가져옴
			
				MemberVO admin = new MemberVO();
				admin.setMember_idx(curridx);
				MemberVO member = mypageService.selectOne(admin);
				model.addAttribute("member", member);
				
				//펀딩리스트
//				List<FundingMainVO> mfl = mypageService.myFundingList(login.getMember_idx());
//				model.addAttribute("myFundingList",mfl);
			
				//펀딩리스트
				List<FundingInfoDetailVO> mfl = mypageService.myFundingList2(admin.getMember_idx());
				model.addAttribute("myFundingList",mfl);
				
				return "admin/admin_info_funding";
			}
			
			@RequestMapping(value = "/info_store.do")
			public String info_store(Model model, int curridx) {
				// 세션에 있는 사용자의 정보를 가져옴
			
				MemberVO admin = new MemberVO();
				admin.setMember_idx(curridx);
				MemberVO member = mypageService.selectOne(admin);
				model.addAttribute("member", member);
				
				//스토어리스트
				List<StoreInfoDetailVO> msl = mypageService.myStoreList(admin.getMember_idx());
				model.addAttribute("myStoreList",msl);
				
				return "admin/admin_info_store";
			}
			
			// 판매자 마이페이지
			@RequestMapping(value = "/mypage2.do",method = RequestMethod.GET)
			public String mypage2(Model model, int member_idx) {
				// 세션에 있는 사용자의 정보 가져옴
				
				MemberVO admin = new MemberVO();
				admin.setMember_idx(member_idx);
				MemberVO member = mypageService.selectOne(admin);
				model.addAttribute("member", member);

				//판매자 펀딩 내역 가져오기
				List<FundingMainVO> sfl = mypageService.sellerFundingList(admin.getMember_idx());
				model.addAttribute("sellerFundingList",sfl);
				
				//판매자 스토어 내역 가져오기
				List<StoreVO> ssl = mypageService.sellerStoreList(admin.getMember_idx());
				model.addAttribute("sellerStoreList", ssl);
				
				return "admin/admin_mypage2";
			}
	
			//펀딩 썸네일 바꾸기
			@RequestMapping(value = "/updateFunThum.do",method = RequestMethod.GET)
			public String updateFunThum(int funding_idx, Model model) {
				model.addAttribute("funding_idx", funding_idx);
				
				return "admin/file_upload";
			}
			@RequestMapping(value = "/updateFunThum.do",method = RequestMethod.POST)
			public void updateFunThum2(int funding_idx, MultipartFile file_upload, 
					HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
				String path = request.getSession().getServletContext().getRealPath("/resources/upload/funding");
				
				String filename = file_upload.getOriginalFilename();
				
				File dir = new File(path);
				
				 if (!dir.exists()) { // 해당 디렉토리가 존재하지 않는 경우
						dir.mkdirs(); // 경로의 폴더가 없는 경우 상위 폴더에서부터 전부 생성
					}
				
				
				 //File dir1 = new File(path+"/"+filename);

				 String extension1 = filename.substring(filename.lastIndexOf("."));
				 String savedThumName = UUID.randomUUID() + extension1; //저장될 파일 명
		 		 File newdir4 = new File(path+"/"+savedThumName);

		 		 /*파일 이름 난수로 변경*/
		 		//dir1.renameTo(newdir4);
		 		 // 업로드할 파일 명이 존재하는 경우
		 		file_upload.transferTo(newdir4);
				
			 	
				FundingMainVO vo = new FundingMainVO();
				vo.setFunding_idx(funding_idx);
				vo.setFunding_thumbnail(savedThumName);
				
				int result = adminService.funding_thumUpdate(vo);
			    response.setContentType("text/html; charset=euc-kr;");
				PrintWriter pw  = response.getWriter();
				
				if(result == 1) {
					pw.println("<script>alert('수정 성공');location.href='" + request.getContextPath() + "/admin/management_product.do'" + "</script>");
				}else {
					pw.println("<script>alert('수정 실패');location.href='" + request.getContextPath() + "/admin/management_product.do'" + "</script>");
				}
				pw.flush();
			}
			
			
			//펀딩 썸네일 바꾸기
			@RequestMapping(value = "/updateStoreThum.do",method = RequestMethod.GET)
			public String updateStoreThum(int store_idx, Model model) {
				model.addAttribute("store_idx", store_idx);
				
				return "admin/file_upload";
			}
			@RequestMapping(value = "/updateStoreThum.do",method = RequestMethod.POST)
			public void updateStoreThum2(int store_idx, MultipartFile file_upload, 
					HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
				String path = request.getSession().getServletContext().getRealPath("/resources/upload/store");
				File dir = new File(path);
				String filename = file_upload.getOriginalFilename();
				
				
				 
				 if (!dir.exists()) { // 해당 디렉토리가 존재하지 않는 경우
						dir.mkdirs(); // 경로의 폴더가 없는 경우 상위 폴더에서부터 전부 생성
					}
				// File dir1 = new File(path+"/"+filename);
				 String extension1 = filename.substring(filename.lastIndexOf("."));
				 String savedThumName = UUID.randomUUID() + extension1; //저장될 파일 명
		 		 File newdir4 = new File(path+"/"+savedThumName);
		        
		 		 System.out.println(filename);
		 		 System.out.println(savedThumName);
		 		 /*파일 이름 난수로 변경*/
			 	// dir1.renameTo(newdir4);
			 	file_upload.transferTo(newdir4);
			 	StoreVO vo = new StoreVO();
				
				vo.setStore_idx(store_idx);
				vo.setStore_thumbnail(savedThumName);
				System.out.println(vo.toString());
				int result = adminService.store_Thumupdate(vo);
			    response.setContentType("text/html; charset=euc-kr;");
				PrintWriter pw  = response.getWriter();
				
				if(result == 1) {
					pw.println("<script>alert('수정 성공');location.href='" + request.getContextPath() + "/admin/management_product.do'" + "</script>");
				}else {
					pw.println("<script>alert('수정 실패');location.href='" + request.getContextPath() + "/admin/management_product.do'" + "</script>");
				}
				
			}
		
			
}
