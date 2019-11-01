package com.chenyx.ssm.controller;


import com.chenyx.ssm.converter.StringAndDateConverter;
import com.chenyx.ssm.domain.Product;
import com.chenyx.ssm.service.IProductService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private IProductService productService;


    //查询全部产品
    @RequestMapping("/findAll.do")
    //@RolesAllowed("ADMIN") //jsr250控制
    //@Secured("ROLE_ADMIN")  //Secured控制
    public ModelAndView findAll(@RequestParam(value="page",required = true,defaultValue="1") Integer page,
                                @RequestParam(value="size",required = true,defaultValue ="4") Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Product> productList =  productService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(productList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("product-list");
        return mv;


    }

    //产品添加
    @RequestMapping("save.do")
    private String save(@RequestParam("productNum") String productNum, @RequestParam("productName") String productName,
                        @RequestParam("departureTimeStr") String departureTimeStr, @RequestParam("cityName") String cityName,
                        @RequestParam("productPrice") Double productPrice, @RequestParam("productStatus") Integer productStatus,
                        @RequestParam("productDesc") String productDesc
    ) throws Exception {
        Product product = new Product();
        product.setProductNum(productNum);
        product.setProductName(productName);
        product.setDepartureTimeStr(StringAndDateConverter.Converter(departureTimeStr));
        product.setCityName(cityName);
        product.setProductPrice(productPrice);
        product.setProductStatus(productStatus);
        product.setProductDesc(productDesc);
        productService.save(product);
        return "redirect:findAll.do";
    }
}
