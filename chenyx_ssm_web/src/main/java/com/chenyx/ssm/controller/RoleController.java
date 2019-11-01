package com.chenyx.ssm.controller;

import com.chenyx.ssm.domain.Permission;
import com.chenyx.ssm.domain.Role;
import com.chenyx.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;
    @RequestMapping("findAll.do")
    public ModelAndView findAll() throws Exception {
        ModelAndView mv=new ModelAndView();
        List<Role> roleList = roleService.findAll();
        mv.addObject("roleList",roleList);
        mv.setViewName("role-list");
        return mv;
    }
    @RequestMapping("/save.do")
    public String save(@RequestParam("roleName") String roleName,@RequestParam("roleDesc") String roleDesc) {
        Role role = new Role();
        role.setRoleName(roleName);
        role.setRoleDesc(roleDesc);
        roleService.save(role);
        return "redirect:findAll.do";
    }

    @RequestMapping("/findById.do")
    public void findById(){

    }


    @RequestMapping("/findByIdAndAllPermission.do")
    public ModelAndView findByIdAndAllPermission(@RequestParam(value = "id",required = true) String roleId ){
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findById(roleId);

        List<Permission> otherPermission = roleService.findOtherPermission(roleId);

        mv.addObject("role",role);
        mv.addObject("permissionList",otherPermission);
        mv.setViewName("role-permission-add");
        return mv;
    }


    @RequestMapping("/addPermissionToRole.do")
    public String  addPermissionToRole(@RequestParam(value = "roleId",required = true) String roleId,@RequestParam( value = "ids",required = true) String[] permissionIds){
        roleService.addPermissionToRole(roleId,permissionIds);
        return "redirect:findAll.do";
    }
}
