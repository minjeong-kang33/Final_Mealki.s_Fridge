package com.itwillbs.dao;

import java.util.List;


import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.RecipeDTO;


public interface RecipeDAO {
	List<String> getRecipLists(String r_num);
	List<RecipeDTO> getRecipeList(PageDTO pageDTO);
	int getRecipeCount();
	void insertRecipe(RecipeDTO recipe);
	void updateRecipe(RecipeDTO recipe);
	void deleteRecipe(String recipeNum);
	RecipeDTO selectRecipe(String recipeNum);

}
