package com.chenyx.ssm.controller;

import com.chenyx.ssm.domain.Syslog;
import com.chenyx.ssm.service.ISysLogService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/syslog")
public class SysLogController {
    @Autowired
    private ISysLogService sysLogService;
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(value="page",required = true,defaultValue="1") Integer page,
                                @RequestParam(value="size",required = true,defaultValue ="4") Integer size) {
        ModelAndView mv=new ModelAndView();
        List<Syslog> syslogList =  sysLogService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(syslogList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("syslog-list");
        return mv ;
    }

}
