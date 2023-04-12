package com.itwillbs.dao;


import java.util.HashMap;

import java.util.List;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RecipeDTO;

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

	@Override
	public List<RecipeDTO> getRecipeList(PageDTO pageDTO) {
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		 
        return sqlSession.selectList(namespace+".getRecipeList", pageDTO);
	}

	@Override
	public int getRecipeCount(PageDTO pageDTO) {
		System.out.println("RecipeDAOImpl getRecipeCount()");
		
		 return sqlSession.selectOne(namespace+".getRecipeCount", pageDTO);
	}

	@Override
	public void insertRecipe(RecipeDTO recipe) {
		System.out.println("RecipeDAOImpl insertRecipe()");
		
		sqlSession.insert(namespace+".insertRecipe", recipe);
	}

	@Override
	public void updateRecipe(RecipeDTO recipe) {
		System.out.println("RecipeDAOImpl updateRecipe()");
		
		sqlSession.update(namespace+".updateRecipe", recipe);
	}

	@Override
	public void deleteRecipe(String recipeNum) {
		System.out.println("RecipeDAOImpl deleteRecipe()");
		
		sqlSession.delete(namespace+".deleteRecipe", recipeNum);
	}

	@Override
	public RecipeDTO selectRecipe(String recipeNum) {
		System.out.println("RecipeDAOImpl selectRecipe()");
		
		Map<String, String> map = new HashMap<>();
		map.put("recipeNum", recipeNum);
		return sqlSession.selectOne(namespace+".selectRecipe", map);
	}

	@Override
	public String getMaxRecipeNum() {
		System.out.println("RecipeDAOImpl getMaxRecipeNum()");
		
		return sqlSession.selectOne(namespace+".getMaxRecipeNum");
	}

	@Override
	public List<ItemDTO> getItemList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getItemList");
	}





	
}
