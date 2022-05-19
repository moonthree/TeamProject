package com.edu.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.edu.service.StoreService;
import com.edu.vo.MemberVO;
import com.edu.vo.StoreOptionVO;
import com.edu.vo.StoreVO;

@Controller
@RequestMapping(value = "/store")
public class StoreController {
	
	@Autowired
	private StoreService sts;

	// 스토어 메인페이지 
	@RequestMapping(value = "/store_main.do")
	public String main() {
		return "store/store_main";
	}
	
	
	// 스토어 뷰페이지 
	@RequestMapping(value = "/store_view.do", method = RequestMethod.GET)
	public String store_view(Model model, StoreOptionVO optionvo) {
		
		// 옵션 출력
		List<StoreOptionVO> optionlist = sts.storeOptionList(optionvo);
		model.addAttribute("optionlist", optionlist);
		
		return "store/store_view";
	}
	/*스토어 상품 등록 페이지*/
	@RequestMapping(value="store_register.do",method = RequestMethod.GET)
	public String stroe_reg(Model model,HttpServletRequest request ) {
		
		MemberVO login = (MemberVO) request.getSession().getAttribute("login");
		model.addAttribute("login",login);
		return "store/store_reg";
	}
	/*스토어 상품 등록 미리보기*/
	@RequestMapping(value="store_preview.do",method = RequestMethod.POST)
	public String store_preview(StoreVO vo, Model model, 
			MultipartFile store_thumbnail_temp ,
			MultipartFile store_Detail_temp,
			MultipartFile store_Notice_temp,
			HttpServletRequest request
			,String store_option_name, int []store_option_price, String store_option_detail, 
			int []store_option_stock) throws IllegalStateException, IOException, ParseException {
		
			System.out.println(vo.toString());
			MemberVO mvo = (MemberVO) request.getSession().getAttribute("login");
		
			
			String path = request.getSession().getServletContext().getRealPath("/resources/upload/store");
		
			File dir = new File(path);
			String org_ThumName = store_thumbnail_temp.getOriginalFilename();
			String org_DetailName = store_Detail_temp.getOriginalFilename();
			String org_NoticeName = store_Notice_temp.getOriginalFilename();
			
			
			if (!dir.exists()) { // 해당 디렉토리가 존재하지 않는 경우
				dir.mkdirs(); // 경로의 폴더가 없는 경우 상위 폴더에서부터 전부 생성
			}

			if (!org_ThumName.isEmpty()) { // 업로드할 파일 명이 존재하는 경우
				store_thumbnail_temp.transferTo(new File(path, org_ThumName));
			}
			
			if(!org_DetailName.isEmpty()) {
				store_Detail_temp.transferTo(new File(path, org_DetailName));
			}
			
			if(!org_NoticeName.isEmpty()) {
				store_Notice_temp.transferTo(new File(path, org_NoticeName));
			}
			
			  model.addAttribute("store", vo); 
			  model.addAttribute("org_ThumName",org_ThumName);
			  model.addAttribute("org_DetailName",org_DetailName);
			  model.addAttribute("org_NoticeName",org_NoticeName);
			  model.addAttribute("login",mvo);
			
			String []strName = store_option_name.split(",");
			String []strDetail = store_option_detail.split(",");
			
			List<StoreOptionVO> optionVo = new ArrayList<StoreOptionVO>();
			
			for(int i=0; i<store_option_price.length; i++) {
				StoreOptionVO voo = new StoreOptionVO();
				voo.setStore_option_name(strName[i]);
				voo.setStore_option_price(store_option_price[i]);
				voo.setStore_option_detail(strDetail[i]);
				voo.setStore_option_stock(store_option_stock[i]);
	
				
				optionVo.add(voo);

			}
			
			/*store 옵션 리스트 모델에 담기*/
			model.addAttribute("optionList", optionVo);
			
		return "store/store_preview";
	}
}
