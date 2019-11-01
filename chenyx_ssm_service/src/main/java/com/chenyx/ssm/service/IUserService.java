package com.chenyx.ssm.service;


import com.chenyx.ssm.domain.Role;
import com.chenyx.ssm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;
import java.util.List;

public interface IUserService extends UserDetailsService {
    public List<UserInfo> findAll() throws Exception;

    public void save(UserInfo userInfo);

    public UserInfo findById(String id) throws Exception;

    public List<Role> findOtherRoles(String userId) throws Exception;

    public void addRoleToUser(String userId,String[] roleId);
}
