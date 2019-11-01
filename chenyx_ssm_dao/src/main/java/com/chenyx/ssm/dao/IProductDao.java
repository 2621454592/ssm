package com.chenyx.ssm.dao;

import com.chenyx.ssm.domain.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IProductDao {

    //根据id查询产品
    @Select("select * from product where id=#{id}")
    public Product findById(String id) throws Exception;

    //查询所以产品信息
    @Select("select * from product")
    public List<Product> findAll() throws Exception;

    //添加产品
    @Insert("insert into product (productNum, productName ,cityName ,departureTime ,productPrice ,productDesc ,productStatus) " +
            "values(#{productNum},#{productName},#{cityName},to_timestamp(#{departureTimeStr,mode=IN},('dd-mm-yyyy hh24:mi:ss:ff')),#{productPrice},#{productDesc},#{productStatus})")
    public void save(Product product) throws Exception;
}
