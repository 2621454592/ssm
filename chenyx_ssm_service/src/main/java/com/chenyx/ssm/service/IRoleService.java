package com.chenyx.ssm.service;

import com.chenyx.ssm.domain.Permission;
import com.chenyx.ssm.domain.Role;

import java.util.List;

public interface IRoleService {
    public List<Role> findAll() throws Exception;

    public void save(Role role);

    public Role findById(String roleId);

    public List<Permission> findOtherPermission(String roleId);

    public void addPermissionToRole(String roleId,String[] permissionIds);
}
