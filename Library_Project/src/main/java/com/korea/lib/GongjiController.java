package com.korea.lib;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.GongjiDAO;
import util.Paging;
import util.View_Path;
import vo.GongjiVO;

@Controller
public class GongjiController {
 
	@Autowired
	HttpServletRequest request;
	
	GongjiDAO gongji_dao;
	public void setGongji_dao(GongjiDAO gongji_dao) {
		this.gongji_dao = gongji_dao;
	}

	//1.공지사항----------------------------------------------------------------
	@RequestMapping("/list.do")
	public String list( Model model, Integer page ) {
		int nowPage = 1;
		//페지이가  null값인경우
		if( page != null ) {
			nowPage = page;
		}
		//페이징 처리를 위한 변수 
		int start = (nowPage - 1) * Common.Gongji.BLOCKLIST + 1;
		int end = start + Common.Gongji.BLOCKLIST - 1;
		HashMap<String, Integer> map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		//페이지별 게시물 조회
		List<GongjiVO> list = gongji_dao.selectList( map );
		//전체 게시물수 구하기
		int row_total = gongji_dao.getRowTotal();
		//페이징 처리
		String pageMenu = Paging.getPaging("list.do", nowPage, 
				row_total, Common.Gongji.BLOCKLIST, Common.Gongji.BLOCKPAGE);
		//포워딩
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);
		//선택 게시물에서 메인메뉴로 나온경우
		request.getSession().removeAttribute("show");
		return View_Path.Gongji_View.VIEW_PATH + "gongji_list.jsp";
	}
	
	//2.선택 공지사항 상세보기----------------------------------------------------------------
	@RequestMapping("/view.do")
	public String view(Model model, int idx ) {
		//선택 게시물 한건 조회
		GongjiVO vo = gongji_dao.selectOne( idx );
		//다중 새로고침 방지 위한 세션 생성
		HttpSession session = request.getSession();
		String show = (String)session.getAttribute("show");
		if( show == null ) {
			//처음으로  게시물 들어올경우
			//조회수증가
			gongji_dao.update_readhit(idx);
			session.setAttribute("show", "");
		}
		model.addAttribute("vo", vo);
		return View_Path.Gongji_View.VIEW_PATH + "gongji_view.jsp";
	}
	
	//3.공지사항 수정----------------------------------------------------------------
	//방명록 수정 폼으로 이동
	@RequestMapping("/modify_form.do")
	public String modify_form(Model model, int idx) {
		GongjiVO vo = gongji_dao.selectOne(idx);
		model.addAttribute("vo", vo);
		return View_Path.Gongji_View.VIEW_PATH + "gongji_modify.jsp";
	}
	//글 수정
	@RequestMapping("/modify.do")
	public String modify( GongjiVO vo, HttpServletRequest request ) {
		int res = gongji_dao.update(vo);
		return "redirect:list.do";
	}

	//4.공지사항 글쓰기----------------------------------------------------------------
	//공지사항 작성 폼으로 이동
	@RequestMapping("/insert_form.do")
	public String insert_form() {
		return View_Path.Gongji_View.VIEW_PATH + "gongji_write.jsp";
	}
	//공지사항 작성
	@RequestMapping("/insert.do")
	public String insert(Model model, GongjiVO vo) {
		gongji_dao.insert(vo);
		return "redirect:list.do";
	}
	
	//5.선택 공지사항 삭제----------------------------------------------------------------
	@RequestMapping("/delete.do")
	@ResponseBody 
	public String delete( int idx) {
		//삭제가 가능한지 확인하자!
		GongjiVO baseVO = gongji_dao.selectOne(idx);
		String resultStr = "";
		String result = "no";
		//삭제가 불가능한 글이라면
		if( baseVO == null ) {
			resultStr = String.format("[{'res':'%s'}]", result);
			return resultStr;
		}
		//삭제가 가능한 게시물일 경우, 지원진 것 처럼 보이도록 내용을 수정
		baseVO.setTitle("삭제된 게시물 입니다");
		baseVO.setName("unknown");
		//삭제가 된 것 처럼 업데이트를 수행
		int res = gongji_dao.del_update(baseVO);
		if( res == 1 ) {
			result = "yes";
		}
		resultStr = String.format("[{'res':'%s'}]", result);
		return resultStr;
	}
	
	//6.그 밖의----------------------------------------------------------------
	//인사말로 이동
	@RequestMapping("/hi.do")
	public String hi() {
		return View_Path.Gongji_View.VIEW_PATH + "hi.jsp";
	}
	//오시는 폼 이동
	@RequestMapping("/come.do")
	public String come() {
		return View_Path.Gongji_View.VIEW_PATH + "come.jsp";
	}
	//조직도로 이동
	@RequestMapping("/familytree.do")
	public String familytree() {
		return View_Path.Gongji_View.VIEW_PATH + "family.jsp";
	}
	
}
