package com.chenyx.ssm.service;

import com.chenyx.ssm.domain.Product;

import java.util.List;

public interface IProductService {
    //查询所有产品信息----未分页
    public List<Product> findAll() throws Exception;
    //查询所有产品信息----分页
    public List<Product> findAll(int page,int size) throws Exception;

    public void save(Product product) throws Exception;
}
