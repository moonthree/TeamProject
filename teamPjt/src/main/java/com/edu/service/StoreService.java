package com.edu.service;

import java.util.List;

import com.edu.vo.MemberVO;
import com.edu.vo.StoreOptionVO;

public interface StoreService {

	// 스토어 메인
	
	// 스토어 뷰
	
	// 스토어 옵션 리스트
	List<StoreOptionVO> storeOptionList(StoreOptionVO vo);

	// 멤버 조회
	MemberVO selectOne(MemberVO vo);

}