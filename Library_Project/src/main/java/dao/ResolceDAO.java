package dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.GongjiVO;
import vo.LentVO;
import vo.MemberVO;
import vo.Resolce_SearchVO;

public class ResolceDAO {
	
	@Autowired
	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//SearchController-----------------------------------------------------------------
	//0.공통사항-----------------------------------------------------------------------
	//책정보 상세보기 페이지(책정보상세보기, 예약)
	public Resolce_SearchVO selectOne(String isbl){
		Resolce_SearchVO vo= sqlSession.selectOne("search.select_one", isbl);
		return vo;
	}
	
	//1.자료검색-----------------------------------------------------------------------
	//최초 자료검색페이지 접근시 자료호출
	public List<Resolce_SearchVO> select(){
		List<Resolce_SearchVO> list = sqlSession.selectList("search.select");
		return list;
	}
	
	//2.컬럼별 내용검색 -----------------------------------------------------------------------
	//책이름
	public List<Resolce_SearchVO> select_bName(String search){
		List<Resolce_SearchVO> list = sqlSession.selectList("search.select_bName", search);
		return list;
	}
	//카테고리
	public List<Resolce_SearchVO> select_category(String search){
		List<Resolce_SearchVO> list = sqlSession.selectList("search.select_category", search);
		return list;
	}
	//회사
	public List<Resolce_SearchVO> select_company(String search){
		List<Resolce_SearchVO> list = sqlSession.selectList("search.select_company", search);
		return list;
	}
	//책번호
	public List<Resolce_SearchVO> select_isbl(String search){
		List<Resolce_SearchVO> list = sqlSession.selectList("search.select_isbl", search);
		return list;
	}
	//연도
	public List<Resolce_SearchVO> select_bYear(String search){
		List<Resolce_SearchVO> list = sqlSession.selectList("search.select_bYear", search);
		return list;
	}
	
	//3.예약 -----------------------------------------------------------------------
	//예약페이지 회원정보 가져오기
	public MemberVO selectID(String m_id) {
		MemberVO vo = sqlSession.selectOne("search.select_m_id", m_id);
		return vo;
	}
	//예약되있는책인지 확인
	public LentVO reserve_lentList(LentVO lentvo){
		LentVO vo = sqlSession.selectOne("search.reserve_lenttwo", lentvo);
		return vo;
	}
	//예약된 정보를 db에 넣어주기
	public int insertLent(LentVO vo) { 
		int res = sqlSession.insert("search.insertLent", vo);
		return res;
	}
	
	//4.신규책 -----------------------------------------------------------------------
	//새책 넣어주기
	public int insertBook(Resolce_SearchVO vo) {
		int res = sqlSession.insert("search.new_book_insert", vo);
		return res;
	}
	//최근 1주일간 추가된 새책 보기
	public List<Resolce_SearchVO> selectTime(){
		List<Resolce_SearchVO> list = sqlSession.selectList("search.selectTime");
		return list;
	}
	
	//5.이달의 추천도서 -----------------------------------------------------------------------
	//회원이 접근하는 이달의 추천책
	public List<Resolce_SearchVO> recommend_select(){
		List<Resolce_SearchVO> list = sqlSession.selectList("search.recommend_select");
		return list;
	}
	
	//관리자 페이지 -----------------------------------------------------------------------
	//1.책 -----------------------------------------------------------------------
	//예약된책 대여해주기
	public int lentupdate(int idx) {
		int res = sqlSession.update("search.lent_update", idx);
		return res;
	}
	//대여된책 반납해주기
	public int rtupdate(int idx) {
		int res = sqlSession.update("search.rt_update", idx);
		return res;
	}
	//예약된책 취소해주기
	public int cancelupdate(int idx) {
		int res = sqlSession.update("search.cancelupdate", idx);
		return res;
	}
	//이달의 추천책 정보 가져오기
	public List<Resolce_SearchVO> selectrmd_book(){
		List<Resolce_SearchVO> list = sqlSession.selectList("search.selectrmd_book");
		return list;
	}
	//일반도서 추천도서로 전환
	public int rmd_update(int idx) {
		int res = sqlSession.update("search.rmd_update", idx);
		return res;
	}
	//추천도서 일반도서로 전환
	public int normal_update(int idx) {
		int res = sqlSession.update("search.normal_update", idx);
		return res;
	}
	
	//SearchController-----------------------------------------------------------------

	
	//LibraryController-----------------------------------------------------------------
	//1.메인화면(본페이지)------------------------------------------------------------
	//메인화면에 뿌려줄 공지사랑 리스트 가져오기
	public List<GongjiVO> selectGongji(){
		List<GongjiVO> list = sqlSession.selectList("search.gongji");
		return list;
	}
	
	//관리자 페이지-----------------------------------------------------------------------
	//1.메인화면(관리자)------------------------------------------------------------
	//관리자 메인페이지에 뿌려줄 예약된책정보
	public List<LentVO> selectLent(){
		List<LentVO> list = sqlSession.selectList("search.selectLent");
		return list;
	}
	
	
	//LibraryController-----------------------------------------------------------------
	
	
	
}
