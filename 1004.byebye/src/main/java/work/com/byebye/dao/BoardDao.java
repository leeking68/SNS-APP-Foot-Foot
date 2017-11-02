package work.com.byebye.dao;

import work.com.byebye.dto.BoardDto;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	private FactoryDAODataSource factory;

	@Autowired
	public void setFactory(FactoryDAODataSource factory) {
		this.factory = factory;
	}

	private static BoardDao instance = new BoardDao();;

	public static BoardDao getInstance() {
		return instance;
	}

	private BoardDao() {
	}

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 업로드 부분 DAO

	BoardDto dto = new BoardDto();
	ArrayList<BoardDto> list = new ArrayList<BoardDto>();
	HashMap<String, String> map = new HashMap<String, String>();

	public int insertBoard(BoardDto dto) {
		return sqlSession.insert("insertBoard", dto);
	}
	
	
	public List<BoardDto> myPlace(String userid,Double lon, double lat) {
		dto = new BoardDto(userid,lon,lat);
		return sqlSession.selectList("myPlace",dto);
	}
	
	// 홈화면  남의 사진 조회
	public List<BoardDto> index(String userid,Double lon,Double lat) {
		dto = new BoardDto(userid,lon,lat);
		return sqlSession.selectList("index", dto);
	}


	// 사진 상세 조회
	public BoardDto myPlaceContent(String docNum) {
		dto = sqlSession.selectOne("indexContent", docNum);
		return dto;
	}
	
	// 남의 사진 상세 조회
		public BoardDto indexContent(String docNum) {
			dto = sqlSession.selectOne("myPlaceContentTwo", docNum);
			return dto;
		}

	// 수정 : 내용파트
	public int updateContent(BoardDto dto) {
		int upt = sqlSession.update("updateContent", dto);
		return upt;
	}

	// 삭제 
	public int deletePlace(String docNum) {
		int delPlace = sqlSession.delete("deletePlace",docNum);
		return delPlace;
	}

}