package com.chenyx.ssm.dao;

import com.chenyx.ssm.domain.Syslog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ISysLogDao {
    @Insert("insert into syslog(visitTime,username,ip,url,executionTime,method)" +
            "values(#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    public void save(Syslog syslog) throws  Exception;

    @Select("select * from sysLog")
    public List<Syslog> findAll();
}
