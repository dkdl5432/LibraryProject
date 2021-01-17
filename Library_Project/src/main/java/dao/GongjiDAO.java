
package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.GongjiVO;

public class GongjiDAO {

	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//GongjiController-----------------------------------------------------------------
	//0.공통사항-----------------------------------------------------------------------
	//선택 게시물 한 건 조회(상세보기, 공지사항 수정)
	public GongjiVO selectOne( int idx ) {
		GongjiVO vo = sqlSession.selectOne("gongji.gongji_one", idx);
		return vo;
	}
	
	//1.공지사항-----------------------------------------------------------------------
	//페이지별 게시물 조회
	public List<GongjiVO> selectList(HashMap<String, Integer> map){
		List<GongjiVO> list = sqlSession.selectList("gongji.gongji_list_condition", map);
		return list;
	}
	//전체 게시물수 구하기
	public int getRowTotal() {
		int count = sqlSession.selectOne("gongji.gongji_count");
		return count;
	}
	
	//2.상세보기-----------------------------------------------------------------------
	//조회수 증가
	public int update_readhit( int idx ) {
		int res = sqlSession.update("gongji.gongji_update_readhit", idx);
		return res;
	}
	
	//3.공지사항 수정-----------------------------------------------------------------------
	//글 수정
	public int update( GongjiVO vo ) {
		int res = sqlSession.update("gongji.gongji_update", vo);
		return res;
	}
	
	//4.공지사항 글쓰기-----------------------------------------------------------------------
	//새글 추가
	public int insert( GongjiVO vo ) {
		int res = sqlSession.insert("gongji.gongji_insert", vo);
		return res;
	}
	
	//5.선택 공지사항 삭제----------------------------------------------------------------
	//삭제(된 것 처럼)업데이트
	public int del_update(GongjiVO vo) {
		int res = sqlSession.update("gongji.del_update", vo);
		return res;
	}
	
	//6.그 밖의----------------------------------------------------------------
	//전체 게시물 조회
	public List<GongjiVO> selectList(){
		List<GongjiVO> list = sqlSession.selectList("gongji.gongji_list");
		return list;
	}
	
	
	
	
	
	

	
	
	
	
		

	
	
	
}
