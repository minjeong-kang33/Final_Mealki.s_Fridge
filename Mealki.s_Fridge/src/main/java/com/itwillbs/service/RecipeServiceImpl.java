package com.itwillbs.service;

import java.util.List;



import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.RecipeDAO;
import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RecipeDTO;

@Service
public class RecipeServiceImpl implements RecipeService{
	
	@Inject
	private RecipeDAO recipeDAO;

	@Override
	public List<String> getRecipLists(String r_num) {
		System.out.println("RecipeServiceImpl getRecipLists");
		return recipeDAO.getRecipLists(r_num);
	}

	@Override
	public List<RecipeDTO> getRecipeList(PageDTO pageDTO) {
		System.out.println("RecipeServiceImpl getRecipeList()");
		
		// 시작하는 행번호 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return recipeDAO.getRecipeList(pageDTO);
	}

	@Override
	public int getRecipeCount(PageDTO pageDTO) {
		System.out.println("RecipeServiceImpl getRecipeCount()");
		
		return recipeDAO.getRecipeCount(pageDTO);
	}

	@Override
	public void save(RecipeDTO recipe) {
		// TODO Auto-generated method stub
		if(recipeDAO.selectRecipe(recipe.getR_num()) == null){
			recipeDAO.insertRecipe(recipe);
		}else{
			recipeDAO.updateRecipe(recipe);
		}
		
		
	}

	@Override
	public void deleteRecipe(String recipeNum) {
		// TODO Auto-generated method stub
		recipeDAO.deleteRecipe(recipeNum);
	}

	@Override
	public String getMaxRecipeNum() {
		// TODO Auto-generated method stub
		return recipeDAO.getMaxRecipeNum();
	}

	@Override
	public List<ItemDTO> getItemList() {
		// TODO Auto-generated method stub
		return recipeDAO.getItemList();
	}




	
}
