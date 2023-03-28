package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.RecipeDAO;

@Service
public class RecipeServiceImpl {
	
	@Inject
	private RecipeDAO recipeDAO;

}
