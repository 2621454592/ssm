package com.chenyx.ssm.controller;


import com.chenyx.ssm.domain.Orders;
import com.chenyx.ssm.service.IOrderService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {

    @Autowired
    private IOrderService orderService;
    //查询全部订单
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value="page",required = true,defaultValue="1") Integer page,
                                @RequestParam(value="size",required = true,defaultValue ="4") Integer size) throws Exception{
        ModelAndView mv = new ModelAndView();
        //System.out.println(productService);
        List<Orders> orderList =  orderService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(orderList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("order-list");
        return mv;
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(@RequestParam(value = "id",required = true) String ordersId) throws Exception {
        ModelAndView mv = new ModelAndView();
        Orders orders = orderService.findById(ordersId);
        mv.addObject(orders);
        mv.setViewName("orders-show");
        return mv;
    }


}
