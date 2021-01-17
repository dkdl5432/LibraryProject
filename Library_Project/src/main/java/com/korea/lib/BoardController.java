
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
import dao.BoardDAO;
import util.Paging;
import util.View_Path;
import vo.BoardVO;
import vo.MemberVO;

@Controller
public class BoardController {

	BoardDAO board_dao;
	public void setBoard_dao(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;

	
	//0.공통사용----------------------------------------------------------------
	//게시글 삭제
	@RequestMapping("/board_delete.do")
	@ResponseBody public String delete( int idx ) {
		String result = "no";
		//삭제가 된 것 처럼 업데이트를 수행 
		int res = board_dao.del_update(idx);
		if( res == 1 ) {
			result = "yes"; 
		}
		return result;
	}
	//자유게시판 선택글 수정
	@RequestMapping("/board_modify.do")
	@ResponseBody
	public String board_modify(BoardVO vo, String page) {
		String result = "no";
		//선택한 게시글에 아이피 저장
		vo.setIp(request.getRemoteAddr());
		int res = board_dao.board_modify(vo);
		if(res == 1) {
			//수정완료
			result = "yes";
		}
		return result;
	}
	
	//1.자유게시판 리스트----------------------------------------------------------------
	@RequestMapping("/board.do")
	public String list( Model model, Integer page ) {
		int nowPage = 1;
		if( page != null ) {
			nowPage = page;
		}
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<BoardVO> list = null;
		list = board_dao.selectList( map );
		int row_total = board_dao.getRowTotal();
		String pageMenu = Paging.getPaging("board.do", nowPage, 
				row_total, Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE);
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);
		request.getSession().removeAttribute("board_view");
		return View_Path.board_View.VIEW_PATH + "board_list.jsp";
	}
	
	//2.자유게시판 상세보기----------------------------------------------------------------
	@RequestMapping("/board_view.do") 
	public String view(Model model, int idx, Integer page ) {
		
		//해당 글 가져오기
		BoardVO vo = board_dao.selectOne( idx );

		//페이징처리
		int nowPage = 1;
		if( page != null ) {
			nowPage = page;
		}
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;
		
		//맵퍼에 시작과 끝 저장 그리고 ref저장
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("ref", vo.getRef());
		
		//페이징 데이터 가져오기
		List<BoardVO> board_List = board_dao.board_com_list_map(map);
		
		int com_total = board_dao.board_com_list_total(vo.getRef());
		String pageMenu = Paging.getPaging_com("board_view.do", nowPage, 
				com_total, Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE,idx);
		
		//조회수 중복 방지
		if(session.getAttribute("board_view") == null) {
			session.setAttribute("board_view", "readhit");
			//조회수 증가
			int res = board_dao.update_readhit(idx);
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("board_List", board_List);
		model.addAttribute("pageMenu", pageMenu);
		return View_Path.board_View.VIEW_PATH + "board_view.jsp";
	}
	//자유게시판 선택 글 수정 폼
	@RequestMapping("/board_modify_form.do")
	public String board_modify_form(int idx, int page, Model model) {
		BoardVO board = board_dao.selectOne(idx);
		model.addAttribute("board", board);
		return View_Path.board_View.VIEW_PATH + "board_modify.jsp"; 
	}

	//3.자유게시판 댓글달기(본페이지)-------------------------------------------------------------------
	//자유게시판 댓글달기
	@RequestMapping("/board_comment.do")
	public String board_comment(BoardVO vo, String page) {
		//유저정보가져오기
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		//선택한 게시글의 정보가져오기
		BoardVO baseVO = board_dao.selectOne( vo.getIdx() );
		
		int res = board_dao.update_step(baseVO);
		
		//정보 vo에 저장
		vo.setSubject(user.getId());
		vo.setName(user.getName());
		vo.setIp(request.getRemoteAddr());//ip
		vo.setRef(baseVO.getRef());
		vo.setStep(baseVO.getStep()+1);
		vo.setMem_id(user.getId());
		
		//댓글달기
		res = board_dao.board_comment(vo);
		
		return "redirect:board_view.do?page="+page+"&idx="+vo.getIdx();
	}
	
	//4.자유게시판 새글쓰기(본페이지)-------------------------------------------------------------------
	//새글 쓰는 폼
	@RequestMapping("/board_insert_form.do") 
	public String insert_form() { 
		return	View_Path.board_View.VIEW_PATH + "board_write.jsp"; 
	}
	//새글쓰기
	@RequestMapping("/board_insert.do") 
	public String insert( Model model, BoardVO vo) {
		//ip얻기
		String ip = request.getRemoteAddr();
		//ip vo에 저장
		vo.setIp(ip);
		board_dao.insert(vo); 
		return "redirect:board.do";
	}
	
	
	  
}
