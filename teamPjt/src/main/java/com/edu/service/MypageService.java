package com.edu.service;

import com.edu.vo.ChangePwVO;
import java.util.Map;

import com.edu.vo.EmailDTO;
import com.edu.vo.FileUploadVO;
import com.edu.vo.MemberVO;


//git 넘기기용
public interface MypageService {

	//프로필 정보 가져오기
	MemberVO selectOne(MemberVO vo);

	//프로필 사진 업데이트
	void update_photo(FileUploadVO vo);
	
	//프로필 정보 업데이트
	int update_profile(MemberVO vo);

	//아이디 찾기
	String findId(MemberVO vo);
	
	//비밀번호 찾기
	String findPw(ChangePwVO vo);
	
	//비밀번호 변경
	int changePw(ChangePwVO vo);
	
	//이메일 보내기
	public void sendMail(EmailDTO dto);
	
}
