package com.edu.service;

import com.edu.vo.FileUploadVO;
import com.edu.vo.MemberVO;

public interface MypageService {

	MemberVO selectOne(MemberVO vo);

	void update_photo(FileUploadVO vo);
	
	int update_profile(MemberVO vo);

}
