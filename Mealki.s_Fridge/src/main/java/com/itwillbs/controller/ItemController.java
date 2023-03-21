package com.itwillbs.controller;

import java.util.List;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.service.ItemService;

@Controller
public class ItemController {
   
	@Inject
	private ItemService itemService;

    // 상품 목록 조회
    @RequestMapping(value = "mdm/item/itemlist", method = RequestMethod.GET)
    public String itemlist(HttpServletRequest request, Model model ) {
    	System.out.println("ItemController itemlist()");
    	
        List<ItemDTO> itemlist = itemService.getItemList();
        model.addAttribute("itemlist",itemlist);
        return "mdm/item/itemlist";
    }

   
}
