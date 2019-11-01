package com.chenyx.ssm.service;

import com.chenyx.ssm.domain.Permission;

import java.util.List;

public interface IPermissionService {
    public List<Permission> findAll() throws Exception;

    public void save(Permission permission)throws Exception;

}
