package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class RecipeDAOImpl implements RecipeDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.recipeMapper";

	@Override
	public List<String> getRecipLists(String r_num) {
		System.out.println("RecipeDAOImpl getRecipLists");
		return sqlSession.selectList(namespace+".getRecipLists");
	}

	
}
