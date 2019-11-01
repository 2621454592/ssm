package com.chenyx.ssm.service;

import com.chenyx.ssm.domain.Syslog;

import java.util.List;


public interface ISysLogService {

    public void save(Syslog syslog) throws Exception;

    public List<Syslog> findAll(int page,int size);
}
