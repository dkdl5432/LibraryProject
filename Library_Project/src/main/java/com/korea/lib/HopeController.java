package com.korea.lib;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.HopeDAO;
import util.Paging;
import util.View_Path;
import vo.HopeVO;
import vo.MemberVO;

@Controller
public class HopeController {
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;
	
	HopeDAO hope_dao;
	public void setHope_dao(HopeDAO hope_dao) {
		this.hope_dao = hope_dao;
	}
	
	//1.희망도서----------------------------------------------------------------
	//희망도서 폼으로 이동
	@RequestMapping("/hope.do")
	public String hope_view() {
		return View_Path.hope_View.VIEW_PATH + "hope_list.jsp";
	}
	//희망도서 신청 폼으로 이동
	@RequestMapping("/hope_list.do")
	public String hope_write() {
		return View_Path.hope_View.VIEW_PATH + "hope_write.jsp";
	}
	//희망도서 신청
	@RequestMapping("/hope_insert.do")
	public String insert(Model model, HopeVO vo, HttpSession session) {
		//세션에 저장된 user의 정보가져오기
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		vo.setM_id(mvo.getId());
		//희망도서 신청
		hope_dao.insert(vo);
		return "redirect:hope_table.do";
	}
	
	//2.아이디별 희망도서 신청내역 확인----------------------------------------------------------------
	//전체 게시물 조회
	@RequestMapping("/hope_table.do")
	public String hope_table( Model model, Integer page, HttpSession session) {
		//세션에 저장된 user의 정보가져오기
		MemberVO mvo = (MemberVO)session.getAttribute("user");
		//페이지가 null 값인경우
		int nowPage = 1;
		if( page != null) {
			nowPage = page;
		}
		// 한 페이지에 표시될 게시물의 시작과 끝 번호를 계산
		int start = (nowPage - 1) * Common.Hope.BLOCKLIST + 1;
		int end = start + Common.Hope.BLOCKLIST - 1;
		HashMap<String, Object> map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("m_id",mvo.getId());
		// 전체 목록 가져오기
		List<HopeVO> hope_table = hope_dao.selectList(map);
		// 전체 게시물 수 가져오기
		int row_total = hope_dao.getRowTotal(map);
		// 페이지 메뉴 생성하기
		String pageMenu = Paging.getPaging("hope_table.do", nowPage, row_total, Common.Hope.BLOCKLIST, Common.Hope.BLOCKPAGE);
		//포워딩
		model.addAttribute("hope_table", hope_table);
		model.addAttribute("pageMenu", pageMenu);
		return View_Path.hope_View.VIEW_PATH + "hope_table.jsp";
	}
	//희망도서 취소
	@ResponseBody
	@RequestMapping("/cancel.do")
	public String cancel(int idx) {
		//결과값을 전달하기위한 변수
		String result = "no";
		String resultStr = "";
		//희망도서 취소(디비상 존재)
		int res = hope_dao.can_update(idx);
		//취소예약이 실패했을경우
		if( res != 1) {
			resultStr = String.format("[{'result':'%s'}]", result);
			return resultStr;
		}
		//정상적으로 취소예약됨
		result = "yes";
		resultStr = String.format("[{'result':'%s'}]", result);
		return resultStr;
	}
	
}
