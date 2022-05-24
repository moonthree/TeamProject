package com.edu.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.edu.dao.MypageDao;
import com.edu.dao.memberDao;
import com.edu.vo.ChangePwVO;
import com.edu.vo.EmailDTO;
import com.edu.vo.FileUploadVO;
import com.edu.vo.FundingInfoDetailParameterVO;
import com.edu.vo.FundingInfoDetailVO;
import com.edu.vo.FundingMainVO;
import com.edu.vo.Funding_expressVO;
import com.edu.vo.Funding_order_payVO;
import com.edu.vo.MemberVO;
import com.edu.vo.StoreExpressVO;
import com.edu.vo.StoreInfoDetailVO;
import com.edu.vo.StoreOrderPayVO;
import com.edu.vo.StoreVO;
import com.edu.vo.ZzimVO;

@Service
public class MypageServiceImp implements MypageService{
	//git 넘기기용
	@Autowired
	private memberDao dao;
	
	@Autowired
	private MypageDao mdao;
	
	//프로필 정보가져오기
	@Override
	public MemberVO selectOne(MemberVO vo) {
		return dao.selectOne(vo);
	}

	//프로필 사진 업데이트
	@Override
	public void update_photo(FileUploadVO vo) {
		mdao.update_photo(vo);
	}

	//프로필 정보 업데이트
	@Override
	public int update_profile(MemberVO vo) {
		return mdao.update_profile(vo);
	}
	
	//아이디 찾기
	@Override
	public String findId(MemberVO vo) {
		return mdao.findId(vo);
	}

	//비밀번호 찾기
	@Override
	public String findPw(ChangePwVO vo) {
		return mdao.findPw(vo);
	}
	
	//비밀번호 변경-멤버 페이지
	@Override
	public int changePw(ChangePwVO vo) {
		return mdao.changePw(vo);
	}

	
	@Inject
    JavaMailSender mailSender; // root-context.xml에 설정한 bean, 의존성을 주입
 
    @Override
    public void sendMail(EmailDTO dto) {
        try {
	        MimeMessage message = mailSender.createMimeMessage();
	        
        	//메일 제목 설정
	        message.setSubject("(펫딩) 임시 비밀번호가 발급되었습니다");
	        
	        //HTML 메일 내용
	        String htmlStr="<h1>안녕하세요 펫딩입니다</h1><br><h2>임시로 발급된 비밀번호 "+dto.getMessage()+"를 입력해주십시오</h2>";
	        htmlStr = "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n" + 
	        		"<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n" + 
	        		"	<head>\r\n" + 
	        		"		<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n" + 
	        		"		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\r\n" + 
	        		"		<title>Portfolio - Responsive Email Template</title>\r\n" + 
	        		"		<style type=\"text/css\">\r\n" + 
	        		"			/* ----- Custom Font Import ----- */\r\n" + 
	        		"			@import url(https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic&subset=latin,latin-ext);\r\n" + 
	        		"\r\n" + 
	        		"			/* ----- Text Styles ----- */\r\n" + 
	        		"			table{\r\n" + 
	        		"				font-family: 'Lato', Arial, sans-serif;\r\n" + 
	        		"				-webkit-font-smoothing: antialiased;\r\n" + 
	        		"				-moz-font-smoothing: antialiased;\r\n" + 
	        		"				font-smoothing: antialiased;\r\n" + 
	        		"			}\r\n" + 
	        		"\r\n" + 
	        		"			@media only screen and (max-width: 700px){\r\n" + 
	        		"				/* ----- Base styles ----- */\r\n" + 
	        		"				.full-width-container{\r\n" + 
	        		"					padding: 0 !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.container{\r\n" + 
	        		"					width: 100% !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				/* ----- Header ----- */\r\n" + 
	        		"				.header td{\r\n" + 
	        		"					padding: 30px 15px 30px 15px !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				/* ----- Projects list ----- */\r\n" + 
	        		"				.projects-list{\r\n" + 
	        		"					display: block !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.projects-list tr{\r\n" + 
	        		"					display: block !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.projects-list td{\r\n" + 
	        		"					display: block !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.projects-list tbody{\r\n" + 
	        		"					display: block !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.projects-list img{\r\n" + 
	        		"					margin: 0 auto 25px auto;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				/* ----- Half block ----- */\r\n" + 
	        		"				.half-block{\r\n" + 
	        		"					display: block !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.half-block tr{\r\n" + 
	        		"					display: block !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.half-block td{\r\n" + 
	        		"					display: block !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.half-block__image{\r\n" + 
	        		"					width: 100% !important;\r\n" + 
	        		"					background-size: cover;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.half-block__content{\r\n" + 
	        		"					width: 100% !important;\r\n" + 
	        		"					box-sizing: border-box;\r\n" + 
	        		"					padding: 25px 15px 25px 15px !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				/* ----- Hero subheader ----- */\r\n" + 
	        		"				.hero-subheader__title{\r\n" + 
	        		"					padding: 80px 15px 15px 15px !important;\r\n" + 
	        		"					font-size: 35px !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.hero-subheader__content{\r\n" + 
	        		"					padding: 0 15px 90px 15px !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				/* ----- Title block ----- */\r\n" + 
	        		"				.title-block{\r\n" + 
	        		"					padding: 0 15px 0 15px;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				/* ----- Paragraph block ----- */\r\n" + 
	        		"				.paragraph-block__content{\r\n" + 
	        		"					padding: 25px 15px 18px 15px !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				/* ----- Info bullets ----- */\r\n" + 
	        		"				.info-bullets{\r\n" + 
	        		"					display: block !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.info-bullets tr{\r\n" + 
	        		"					display: block !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.info-bullets td{\r\n" + 
	        		"					display: block !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.info-bullets tbody{\r\n" + 
	        		"					display: block;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.info-bullets__icon{\r\n" + 
	        		"					text-align: center;\r\n" + 
	        		"					padding: 0 0 15px 0 !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.info-bullets__content{\r\n" + 
	        		"					text-align: center;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.info-bullets__block{\r\n" + 
	        		"					padding: 25px !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				/* ----- CTA block ----- */\r\n" + 
	        		"				.cta-block__title{\r\n" + 
	        		"					padding: 35px 15px 0 15px !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.cta-block__content{\r\n" + 
	        		"					padding: 20px 15px 27px 15px !important;\r\n" + 
	        		"				}\r\n" + 
	        		"\r\n" + 
	        		"				.cta-block__button{\r\n" + 
	        		"					padding: 0 15px 0 15px !important;\r\n" + 
	        		"				}\r\n" + 
	        		"			}\r\n" + 
	        		"		</style>\r\n" + 
	        		"\r\n" + 
	        		"		<!--[if gte mso 9]><xml>\r\n" + 
	        		"			<o:OfficeDocumentSettings>\r\n" + 
	        		"				<o:AllowPNG/>\r\n" + 
	        		"				<o:PixelsPerInch>96</o:PixelsPerInch>\r\n" + 
	        		"			</o:OfficeDocumentSettings>\r\n" + 
	        		"		</xml><![endif]-->\r\n" + 
	        		"	</head>\r\n" + 
	        		"\r\n" + 
	        		"	<body style=\"padding: 0; margin: 0;\" bgcolor=\"#eeeeee\">\r\n" + 
	        		"		<span style=\"color:transparent !important; overflow:hidden !important; display:none !important; line-height:0px !important; height:0 !important; opacity:0 !important; visibility:hidden !important; width:0 !important; mso-hide:all;\">This is your preheader text for this email (Read more about email preheaders here - https://goo.gl/e60hyK)</span>\r\n" + 
	        		"\r\n" + 
	        		"		<!-- / Full width container -->\r\n" + 
	        		"		<table class=\"full-width-container\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" bgcolor=\"#eeeeee\" style=\"width: 100%; height: 100%; padding: 30px 0 30px 0;\">\r\n" + 
	        		"			<tr>\r\n" + 
	        		"				<td align=\"center\" valign=\"top\">\r\n" + 
	        		"					<!-- / 700px container -->\r\n" + 
	        		"					<table class=\"container\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"700\" bgcolor=\"#ffffff\" style=\"width: 700px;\">\r\n" + 
	        		"						<tr>\r\n" + 
	        		"							<td align=\"center\" valign=\"top\">\r\n" + 
	        		"								<!-- / Header -->\r\n" + 
	        		"								<table class=\"container header\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"620\" style=\"width: 620px;\">\r\n" + 
	        		"									<tr>\r\n" + 
	        		"										<td style=\"padding: 30px 0 30px 0; border-bottom: solid 1px #eeeeee;\" align=\"left\">\r\n" + 
	        		"											<span style=\"font-size: 30px; text-decoration: none; color: #000000;\">PetDDing</span>\r\n" + 
	        		"										</td>\r\n" + 
	        		"									</tr>\r\n" + 
	        		"								</table>\r\n" + 
	        		"								<!-- /// Header -->\r\n" + 
	        		"\r\n" + 
	        		"								<!-- / Hero subheader -->\r\n" + 
	        		"								<table class=\"container hero-subheader\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"620\" style=\"width: 620px;\">\r\n" + 
	        		"									<tr>\r\n" + 
	        		"										<td class=\"hero-subheader__title\" style=\"font-size: 30px; font-weight: bold; padding: 80px 0 15px 0;\" align=\"left\">임시 비밀번호가 발급되었습니다</td>\r\n" + 
	        		"									</tr>\r\n" + 
	        		"\r\n" + 
	        		"									<tr>\r\n" + 
	        		"										<td class=\"hero-subheader__content\" style=\"font-size: 20px; line-height: 27px; color: #969696; padding: 0 60px 90px 0;\" align=\"left\">\r\n" + 
	        		"											안녕하세요 "+dto.getReceiveName()+"님,<br>\r\n" + 
	        		"											새로 발급된 비밀번호는 다음과 같습니다\r\n" + 
	        		"										\r\n" + 
	        		"										</td>\r\n" + 
	        		"									</tr>\r\n" + 
	        		"								</table>\r\n" + 
	        		"								<!-- /// Hero subheader -->\r\n" + 
	        		"\r\n" + 
	        		"								\r\n" + 
	        		"								\r\n" + 
	        		"								<!-- / CTA Block -->\r\n" + 
	        		"								<table class=\"container cta-block\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n" + 
	        		"									<tr>\r\n" + 
	        		"										<td align=\"center\" valign=\"top\">\r\n" + 
	        		"											<table class=\"container\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"620\" style=\"width: 620px;\">\r\n" + 
	        		"												\r\n" + 
	        		"												<tr>\r\n" + 
	        		"													<td class=\"cta-block__title\" style=\"padding: 50px 0 35px 0; font-size: 26px; text-align: center;\">"+dto.getMessage()+"</td>\r\n" + 
	        		"												</tr>\r\n" + 
	        		"												<tr>\r\n" + 
	        		"													<td align=\"center\">\r\n" + 
	        		"														<table class=\"container\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n" + 
	        		"															<tr>\r\n" + 
	        		"																<td class=\"cta-block__button\" width=\"230\" align=\"center\" style=\"width: 200px;\">\r\n" + 
	        		"																	<a href=\"http://localhost:8080/test/member/login.do\" style=\"border: 3px solid #eeeeee; color: #969696; text-decoration: none; padding: 15px 45px; text-transform: uppercase; display: block; text-align: center; font-size: 16px;\">로그인하기</a>\r\n" + 
	        		"																</td>\r\n" + 
	        		"															</tr>\r\n" + 
	        		"														</table>\r\n" + 
	        		"													</td>\r\n" + 
	        		"												</tr>\r\n" + 
	        		"												<tr>\r\n" + 
	        		"													<td class=\"cta-block__title\" style=\"padding: 350px 0 0 0; font-size: 26px; text-align: center;\">About Us</td>\r\n" + 
	        		"												</tr>\r\n" + 
	        		"\r\n" + 
	        		"												<tr>\r\n" + 
	        		"													<td class=\"cta-block__content\" style=\"padding: 20px 0 27px 0; font-size: 16px; line-height: 27px; color: #969696; text-align: center;\">\r\n" + 
	        		"													저희 펫딩은 반려동물 물품의 펀딩과 판매를 하고 있습니다\r\n" + 
	        		"														<br>이용해 주셔서 감사합니다\r\n" + 
	        		"												</td>\r\n" + 
	        		"												</tr>\r\n" + 
	        		"											</table>\r\n" + 
	        		"										</td>\r\n" + 
	        		"									</tr>\r\n" + 
	        		"								</table>\r\n" + 
	        		"								<!-- /// CTA Block -->\r\n" + 
	        		"\r\n" + 
	        		"								<!-- / Divider -->\r\n" + 
	        		"								<table class=\"container\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"padding-top: 25px;\" align=\"center\">\r\n" + 
	        		"									<tr>\r\n" + 
	        		"										<td align=\"center\">\r\n" + 
	        		"											<table class=\"container\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"620\" align=\"center\" style=\"border-bottom: solid 1px #eeeeee; width: 620px;\">\r\n" + 
	        		"												<tr>\r\n" + 
	        		"													<td align=\"center\">&nbsp;</td>\r\n" + 
	        		"												</tr>\r\n" + 
	        		"											</table>\r\n" + 
	        		"										</td>\r\n" + 
	        		"									</tr>\r\n" + 
	        		"								</table>\r\n" + 
	        		"								<!-- /// Divider -->\r\n" + 
	        		"\r\n" + 
	        		"								<!-- / Info Bullets -->\r\n" + 
	        		"								<table class=\"container info-bullets\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" align=\"center\">\r\n" + 
	        		"									<tr>\r\n" + 
	        		"										<td align=\"center\">\r\n" + 
	        		"											<table class=\"container\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"620\" align=\"center\" style=\"width: 620px;\">\r\n" + 
	        		"												<tr>\r\n" + 
	        		"													<td class=\"info-bullets__block\" style=\"padding: 30px 30px 15px 30px;\" align=\"center\">\r\n" + 
	        		"														<table class=\"container\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n" + 
	        		"															<tr>\r\n" + 
	        		"																<td class=\"info-bullets__icon\" style=\"padding: 0 15px 0 0;\">\r\n" + 
	        		"																	<img src=\"https://i.ibb.co/tmcVjnM/email.png\" style=\"width: 20px;\">\r\n" + 
	        		"																</td>\r\n" + 
	        		"																<td class=\"info-bullets__content\" style=\"color: #969696; font-size: 16px;\">contactPetDDing@gmail.com</td>\r\n" + 
	        		"															</tr>\r\n" + 
	        		"														</table>\r\n" + 
	        		"													</td>\r\n" + 
	        		"\r\n" + 
	        		"													<td class=\"info-bullets__block\" style=\"padding: 30px 30px 15px 30px;\" align=\"center\">\r\n" + 
	        		"														<table class=\"container\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\">\r\n" + 
	        		"															<tr>\r\n" + 
	        		"																<td class=\"info-bullets__icon\" style=\"padding: 0 15px 0 0;\">\r\n" + 
	        		"																	<img src=\"https://i.ibb.co/RTwYWtS/telephone.png\" style=\"width: 20px;\">\r\n" + 
	        		"																</td>\r\n" + 
	        		"\r\n" + 
	        		"																<td class=\"info-bullets__content\" style=\"color: #969696; font-size: 16px;\">(541) 754-3010</td>\r\n" + 
	        		"															</tr>\r\n" + 
	        		"														</table>\r\n" + 
	        		"													</td>\r\n" + 
	        		"												</tr>\r\n" + 
	        		"											</table>\r\n" + 
	        		"										</td>\r\n" + 
	        		"									</tr>\r\n" + 
	        		"								</table>\r\n" + 
	        		"								<!-- /// Info Bullets -->\r\n" + 
	        		"\r\n" + 
	        		"								<!-- / Footer -->\r\n" + 
	        		"								<table class=\"container\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" align=\"center\">\r\n" + 
	        		"									<tr>\r\n" + 
	        		"										<td align=\"center\">\r\n" + 
	        		"											<table class=\"container\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"620\" align=\"center\" style=\"border-top: 1px solid #eeeeee; width: 620px;\">\r\n" + 
	        		"												<tr>\r\n" + 
	        		"													<td style=\"text-align: center; padding: 50px 0 10px 0;\">\r\n" + 
	        		"														<a href=\"#\" style=\"font-size: 28px; text-decoration: none; color: #d5d5d5;\">PetDDing</a>\r\n" + 
	        		"													</td>\r\n" + 
	        		"												</tr>\r\n" + 
	        		"\r\n" + 
	        		"												<tr>\r\n" + 
	        		"													<td align=\"middle\">\r\n" + 
	        		"														<table width=\"60\" height=\"2\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 60px; height: 2px;\">\r\n" + 
	        		"															<tr>\r\n" + 
	        		"																<td align=\"middle\" width=\"60\" height=\"2\" style=\"background-color: #eeeeee; width: 60px; height: 2px; font-size: 1px;\"><img src=\"https://i.ibb.co/JQVY1xD/111.png\" style=\"width: 100px;\"></td>\r\n" + 
	        		"															</tr>\r\n" + 
	        		"														</table>\r\n" + 
	        		"													</td>\r\n" + 
	        		"												</tr>\r\n" + 
	        		"\r\n" + 
	        		"												<tr>\r\n" + 
	        		"													<td style=\"color: #d5d5d5; text-align: center; font-size: 15px; padding: 10px 0 60px 0; line-height: 22px;\"></td>\r\n" + 
	        		"												</tr>\r\n" + 
	        		"											</table>\r\n" + 
	        		"										</td>\r\n" + 
	        		"									</tr>\r\n" + 
	        		"								</table>\r\n" + 
	        		"								<!-- /// Footer -->\r\n" + 
	        		"							</td>\r\n" + 
	        		"						</tr>\r\n" + 
	        		"					</table>\r\n" + 
	        		"				</td>\r\n" + 
	        		"			</tr>\r\n" + 
	        		"		</table>\r\n" + 
	        		"	</body>\r\n" + 
	        		"</html>";
	        //내용설정 
	        message.setText(htmlStr, "utf-8", "html");

	        //TO 설정 
	        message.addRecipient(RecipientType.TO, 
	                             new InternetAddress(dto.getReceiveMail(), dto.getReceiveName()+"님", "utf-8"));

	        mailSender.send(message);
		    
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //펀딩 3개
	@Override
	public List<FundingInfoDetailVO> select3Funding(int member_idx) {
		return mdao.select3Funding(member_idx);
	}
	
	//펀딩 4개
	@Override
	public List<FundingInfoDetailVO> select4Funding(int member_idx) {
		return mdao.select4Funding(member_idx);
	}
	
	//스토어 3개
	@Override
	public List<StoreInfoDetailVO> select3Store(int member_idx) {
		return mdao.select3Store(member_idx);
	}

	//찜 3개
	@Override
	public List<ZzimVO> select3Zzim(int member_idx) {
		return mdao.select3Zzim(member_idx);
	}

	
	//펀딩 개수  & 스토어 개수 & 찜 개수
	@Override
	public int countFunding(int member_idx) {
		return mdao.countFunding(member_idx);
	}
	@Override
	public int countStore(int member_idx) {
		return mdao.countStore(member_idx);
	}
	@Override
	public int countZzim(int member_idx) {
		return mdao.countZzim(member_idx);
	}

	//펀딩 내역
	@Override
	public List<FundingMainVO> myFundingList(int member_idx) {
		return mdao.myFundingList(member_idx);
	}
	
	//펀딩 내역2 - info_funding
	@Override
	public List<FundingInfoDetailVO> myFundingList2(int member_idx) {
		return mdao.myFundingList2(member_idx);
	}
    
	//스토어 내역 - info_store
	@Override
	public List<StoreInfoDetailVO> myStoreList(int member_idx) {
		return mdao.myStoreList(member_idx);
	}

	@Override
	public List<FundingMainVO> myZzimList(int member_idx) {
		return mdao.myZzimList(member_idx);
	}

	//판매자 펀딩 내역 mypage2
	@Override
	public List<FundingMainVO> sellerFundingList(int member_idx) {
		return mdao.sellerFundingList(member_idx);
	}
	//판매자 스토어 내역 mypage2
	@Override
	public List<StoreVO> sellerStoreList(int member_idx) {
		return mdao.sellerStoreList(member_idx);
	}

	/*funding_info_detail*/
	//funding & funding_order
	@Override
	public FundingInfoDetailVO fundingDetail(int funding_order_idx) {
		return mdao.fundingDetail(funding_order_idx);
	}
	//funding_order_pay
	@Override
	public Funding_order_payVO fundingPayDetail(int funding_order_idx) {
		return mdao.fundingPayDetail(funding_order_idx);
	}
	//funding_order_express
	@Override
	public Funding_expressVO fundingExpressDetail(Map<String, Object> param) {
		return mdao.fundingExpressDetail(param);
	}
	//funding_option
	@Override
	public List<FundingInfoDetailVO> fundingOptionDetail(int funding_order_idx) {
		return mdao.fundingOptionDetail(funding_order_idx);
	}
	
	/*store_info_detail*/
	@Override
	public StoreInfoDetailVO storeDetail(int store_order_idx) {
		return mdao.storeDetail(store_order_idx);
	}
	@Override
	public StoreOrderPayVO storePayDetail(int store_order_idx) {
		return mdao.storePayDetail(store_order_idx);
	}

	@Override
	public StoreExpressVO storeExpressDetail(int store_order_idx) {
		return mdao.storeExpressDetail(store_order_idx);
	}
	@Override
	public List<StoreInfoDetailVO> storeOptionDetail(int store_order_idx) {
		return mdao.storeOptionDetail(store_order_idx);
	}

	
	
	
	//찜 취소
	@Override
	public int deleteZzim(Map<String, Integer> paramMap) {
		return mdao.deleteZzim(paramMap);
	}

	//비밀번호 변경-마이페이지
	@Override
	public int changePw(Map<String, Object> paramMap) {
		return mdao.changePassword(paramMap);
	}
	
	//주소 변경 - funding_info_detail
	@Override
	public int changeExpress(Map<String, Object> paramMap) {
		return mdao.changeExpress(paramMap);
	}

	
	//펀딩 취소
	@Override
	public int fundingWithdraw(int funding_order_idx) {
		return mdao.fundingWithdraw(funding_order_idx);
	}

	@Override
	public int storeWithdraw(int store_order_idx) {
		return mdao.storeWithdraw(store_order_idx);
	}


	
}
