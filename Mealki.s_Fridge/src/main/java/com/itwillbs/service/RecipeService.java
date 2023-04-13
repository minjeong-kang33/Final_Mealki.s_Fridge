package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RecipeDTO;

public interface RecipeService {
	List<String> getRecipLists(String r_num);
	List<RecipeDTO> getRecipeList(PageDTO pageDTO);
	int getRecipeCount(PageDTO pageDTO);
	void save(RecipeDTO recipe);
	void deleteRecipe(String recipeNum);
	String getMaxRecipeNum();
	List<ItemDTO> getItemList();

}
