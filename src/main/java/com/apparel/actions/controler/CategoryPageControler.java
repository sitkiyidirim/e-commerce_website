package com.apparel.actions.controler;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.apparel.model.entity.catalog.CategoryModel;
import com.apparel.model.service.catalog.CategoryService;
import com.apparel.model.service.catalog.ProductService;


@Controller
@EnableAsync
@RequestMapping(value = "/**/c")
public class CategoryPageControler extends BaseControl {

    private static final Logger logger = LoggerFactory.getLogger(CategoryPageControler.class);
    
    protected static final String CATEGORY_CODE_PATH_VARIABLE_PATTERN = "/{categoryCode:.*}";
    @Resource
    private CategoryService categoryService;


    @RequestMapping(value = CATEGORY_CODE_PATH_VARIABLE_PATTERN, method = RequestMethod.GET)
    public String category(@PathVariable("categoryCode") final Integer categoryCode, final Model model, final HttpServletRequest httpServletRequest, final HttpServletResponse response) {

        model.addAttribute("categoryCode", categoryCode);
        CategoryModel category =  categoryService.findById(categoryCode);
        model.addAttribute("productList", category.getProducts());
        
        return "/category";
    }

}