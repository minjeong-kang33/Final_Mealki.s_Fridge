package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.RecipeDAO;

@Service
public class RecipeServiceImpl implements RecipeService{
	
	@Inject
	private RecipeDAO recipeDAO;

	@Override
	public List<String> getRecipLists(String r_num) {
		System.out.println("RecipeServiceImpl getRecipLists");
		return recipeDAO.getRecipLists(r_num);
	}


	
}
