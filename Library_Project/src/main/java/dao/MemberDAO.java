package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BoardVO;
import vo.GongjiVO;
import vo.LentVO;
import vo.MemberVO;
import vo.Resolce_SearchVO;

@Repository("member_dao")
public class MemberDAO {

	@Autowired
	SqlSession sqlSession;
	
	//LibraryController(본페이지)-----------------------------------------------------------------
	//공통 사항 ------------------------------------------------------------
	//인증완료후 아이디 찾기(아이디찾기, 개인정보 변경, 회원 탈퇴)
	public MemberVO idx_select(int m_idx) {
		MemberVO user = sqlSession.selectOne("member.member_search_idx", m_idx);
		return user;
	}
	//선택 유저 정보 삭제(회원 탈퇴(본페이지), 회원관리(관리자))
	public int admin_user_del(int m_idx) {
		int res = sqlSession.update("member.admin_user_del", m_idx);
		return res;
	}
	//개인정보 변경 - 개인정보 변경(비밀번호 x)(내서재(본페이지), 유저관리(관리자))
	public int user_update_nopwd(MemberVO vo) {
		int res = sqlSession.update("member.member_update_user_nopwd", vo);
		return res;
	}
	//개인정보 변경 - 개인정보 변경(비밀번호 o)(내서재(본페이지), 유저관리(관리자))
	public int user_update_yespwd(MemberVO vo) {
		int res = sqlSession.update("member.member_update_user_yespwd", vo);
		return res;
	}
	
	//2.로그인(본페이지)------------------------------------------------------------
	//아이디 중복체크
	public MemberVO id_check(String id) {
		System.out.println("id:" +id );
		MemberVO vo = sqlSession.selectOne("member.member_id_check", id);
		return vo;
	}
	
	
	//3.회원가입(본페이지) -------------------------------------------------------------
	//회원정보 db에 저장
	public int regi_insert(MemberVO vo) {
		int res = sqlSession.insert("member.member_insert", vo);
		return res;
	}
	
	//4.아이디 비밀번호 찾기(본페이지)------------------------------------------------------
	//아이디 찾기
	public MemberVO id_search(MemberVO vo) {
		MemberVO user = sqlSession.selectOne("member.member_search_id", vo);
		return user;
	}
	//비밀번호 찾기
	public MemberVO pwd_search(MemberVO vo) {
		MemberVO user = sqlSession.selectOne("member.member_search_pwd", vo);
		return user;
	}
	//비밀번호 변경
	public int pwd_update(MemberVO vo ) {
		int res = sqlSession.update("member.member_update_pwd", vo);
		return res;
	}
	
	//5.내서재(본페이지)-----------------------------------------------------------------
	//대출이력 조회(lent 테이블 접근)
	public List<LentVO> user_lent_search(String m_id){
		List<LentVO> lent_List = sqlSession.selectList("member.user_lent_search", m_id);
		return lent_List;
	}
	//대출이력 조회 취소버튼
	public int user_lent_ccr(int idx) {
		int res = sqlSession.update("member.user_lent_ccr", idx);
		return res;
	}
	//LibraryController(본페이지)-----------------------------------------------------------------

	
	//LibraryController(관리자)-----------------------------------------------------------------
	//관리자-----------------------------------------------------------------
	//2.책(관리자)====================================================================
	//책의 모든정보
	public List<Resolce_SearchVO> admin_book_list(){
		List<Resolce_SearchVO> book_List = sqlSession.selectList("member.admin_book_list");
		return book_List;
	}
	//대여 반납 관리
	public List<LentVO> admin_lent_list(){
		List<LentVO> lent_List = sqlSession.selectList("member.admin_lent_list");
		return lent_List;
	}
	
	//3.회원(관리자)====================================================================
	//모든 유저의 정보
	public List<MemberVO> admin_user_list(){
		List<MemberVO> user_List = sqlSession.selectList("member.admin_user_list");
		return user_List;
	}
	//선택 유저 정보 복구(삭제했던 정보 복구처리)
	public int admin_user_restore(int m_idx) {
		int res = sqlSession.update("member.admin_user_restore", m_idx);
		return res;
	}
	
	//4.열린마당(관리자)====================================================================
	//자유게시판 정보 가져오기**************************************************
	public List<BoardVO> admin_board_qa_list(){
		List<BoardVO> board_List = sqlSession.selectList("member.admin_board_qa_list");
		return board_List;
	}
	//선택 자유게시판 정보 가져오기
	public BoardVO admin_board_selectone(int idx) {
		BoardVO board = sqlSession.selectOne("member.admin_board_selectone", idx);
		return board;
	}
	//선택 자유게시판 정보 삭제
	public int admin_board_del(int idx) {
		int res = sqlSession.update("member.admin_board_del", idx);
		return res;
	}
	//선택 자유게시판정보 복구(삭제한것 복구 처리)
	public int admin_board_restore(int idx) {
		int res = sqlSession.update("member.admin_board_restore", idx);
		return res;
	}
	//선택 자유게시판 뎃글 가져오기
	public List<BoardVO> admin_board_com_list(BoardVO vo) {
		List<BoardVO> board_List = sqlSession.selectList("member.admin_board_com_list", vo);
		return board_List;
	}
	
	//공지사항 정보 가져오기*****************************************************
	public List<GongjiVO> admin_gongji_list(){
		List<GongjiVO> gongji_List = sqlSession.selectList("member.admin_gongji_list");
		return gongji_List;
	}
	//선택 공지사항 정보 가져오기
	public GongjiVO admin_gongji_selectone(int idx) {
		GongjiVO gongji = sqlSession.selectOne("gongji.gongji_one", idx);
		return gongji;
	}
	//공지사항 글 수정
	public int admin_gongji_update(GongjiVO vo) {
		int res = sqlSession.update("gongji.gongji_update", vo);
		return res;
	}
	//공지사항 선택글 삭제
	public int admin_gongji_del(int idx) {
		int res = sqlSession.update("member.admin_gongji_del", idx);
		return res;
	}
	//공지사항 선택글 복구
	public int admin_gongji_restore(int idx) {
		int res = sqlSession.update("member.admin_gongji_restore", idx);
		return res;
	}
	//공지사항 선택글 공지글로 변경
	public int admin_gongji_main(int idx) {
		int res = sqlSession.update("member.admin_gongji_main", idx);
		return res;
	}
	//공지사항 글 작성
	public int admin_gongji_insert(GongjiVO vo) {
		int res = sqlSession.insert("gongji.gongji_insert", vo);
		return res;
	}
	
	//LibraryController(관리자)-----------------------------------------------------------------
}
