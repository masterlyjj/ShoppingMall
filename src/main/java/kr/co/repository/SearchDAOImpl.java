package kr.co.repository;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAOImpl implements SearchDAO{

	@Autowired
	private SqlSession sqlSession;
	private String NS = "kr.co.search";
	
	@Override
	public void insert(Map<String, Object> map) {
		sqlSession.insert(NS +".insert", map);
	}

	@Override
	public void searchlist(Map<String, Object> map) {
		sqlSession.selectList(NS + ".searchlist", map);
	}

		
	
}
