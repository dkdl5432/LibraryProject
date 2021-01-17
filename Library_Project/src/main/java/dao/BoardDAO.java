
package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;

public class BoardDAO {

	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//BoardController-----------------------------------------------------------------
	//0.공통사용-----------------------------------------------------------------------
	//게시글 삭제(업데이트)
	public int del_update(int idx) {
		int res = sqlSession.update("board.del_update", idx);
		return res;
	}
	//게시물 한 건 조회(자유게시판 - 상세보기, 글수정, 댓글달기)
	public BoardVO selectOne( int idx ) {
		BoardVO vo = sqlSession.selectOne("board.board_one", idx);
		return vo;
	}
	
	//1.자유게시판(본페이지)------------------------------------------------------------
	//페이지별 게시물 조회
	public List<BoardVO> selectList(HashMap<String, Integer> map){
		List<BoardVO> list = sqlSession.selectList("board.board_list_condition", map);
		return list;
	}
	//전체 게시물수 구하기
	public int getRowTotal() {
		int count = sqlSession.selectOne("board.board_count");
		return count;
	}
	
	//2.자유게시판 상세보기(본페이지)------------------------------------------------------------
	//페이징 댓글가져오기
	public List<BoardVO> board_com_list_map(HashMap<String, Integer> map){
		List<BoardVO> board_List = sqlSession.selectList("board.board_com_list_map", map);
		return board_List;
	}
	//댓글의 총갯수 가져오기
	public int board_com_list_total(int ref) {
		int count = sqlSession.selectOne("board.board_com_list_total", ref);
		return count;
	}
	//조회수 증가
	public int update_readhit( int idx ) {
		int res = sqlSession.update("board.board_update_readhit", idx);
		return res;
	}
	
	//3.자유게시판 댓글달기(본페이지)------------------------------------------------------------
	//step수정
	public int update_step( BoardVO baseVO ) {
		int res = sqlSession.update("board.board_update_step", baseVO);
		return res;
	}
	//자유게시판 댓글달기
	public int board_comment( BoardVO vo ) {
		int res = sqlSession.insert("board.board_comment", vo);
		return res;
	}
	
	//4.자유게시판 새글쓰기(본페이지)------------------------------------------------------------
	//새글 추가
	public int insert( BoardVO vo ) {
		int res = sqlSession.insert("board.board_insert", vo);
		return res;
	}
	
	//BoardController-----------------------------------------------------------------
	
	//LibraryController-----------------------------------------------------------------
	//4.열린마당(관리자 페이지)------------------------------------------------------------
	//페이징 댓글가져오기(선택 자유게시판글보기(관리자))
	public List<BoardVO> admin_board_com_list_map(HashMap<String, Integer> map){
		List<BoardVO> board_List = sqlSession.selectList("board.admin_board_com_list_map", map);
		return board_List;
	}
	//댓글의 총갯수 가져오기
	public int admin_board_com_list_total(int ref) {
		int count = sqlSession.selectOne("board.admin_board_com_list_total", ref);
		return count;
	}
	
	//LibraryController-----------------------------------------------------------------
	
	
	//그밖의 것-----------------------------------------------------------------
	//해당게시글의 댓글 가져오기
	public List<BoardVO> board_comment_list(BoardVO vo){
		List<BoardVO> board_List = sqlSession.selectList("board.board_comment_list", vo);
		return board_List;
	}
	//해당 게시글의 수정
	public int board_modify(BoardVO vo) {
		int res = sqlSession.update("board.board_modify", vo);
		return res;
	}
	
	
}
