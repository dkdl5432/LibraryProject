package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.HopeVO;

@Repository("hope_dao")
public class HopeDAO {

	@Autowired
	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//HopeController-----------------------------------------------------------------
	//1.희망도서-----------------------------------------------------------------------
	//희망도서 신청
	public int insert( HopeVO vo) {
		System.out.println(vo.getIsbn());
		int res = sqlSession.insert("hope.hope_insert", vo);
		return res;
	}
	
	//2.아이디별 희망도서 신청내역 확인-----------------------------------------------------------------------
	//페이지별 게시물 조회
	public List<HopeVO> selectList(HashMap<String, Object> map){
		List<HopeVO> hope_table = sqlSession.selectList("hope.hope_list_condition", map);
		return hope_table;
	}
	//전체 게시물수 구하기
	public int getRowTotal(HashMap<String, Object> map) {
		int count = sqlSession.selectOne("hope.hope_count", map);
		return count;
	}
	//희망도서 취소(유저)
	public int can_update(int idx) {
		int result = sqlSession.update("hope.hope_update", idx);
		return result;
	}
	
	//3.그밖의-----------------------------------------------------------------------
	//게시물 한 건 조회
	public HopeVO selectOne( int idx) {
		HopeVO vo = sqlSession.selectOne("hope.bope_one", idx);
		return vo;
	}
	
	//LibraryController(관리자 같이사용)-----------------------------------------------------------------
	//전체 게시물 조회
	public List<HopeVO> selectList(){
		List<HopeVO> hope_table = sqlSession.selectList("hope.hope_list");
		return hope_table;
	}
	//희망도서 승인부분
	public int allow_update(int idx) {
		int result = sqlSession.update("hope.allow_hope_update", idx);
		return result;
	}
	//희망도서 거절
	public int reject_update(int idx) {
		System.out.println("dao : " + idx);
		int result = sqlSession.update("hope.reject_hope_update", idx);
		return result;
	}
	
}
