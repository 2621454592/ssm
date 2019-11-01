package com.chenyx.ssm.service;

import com.chenyx.ssm.domain.Orders;

import java.util.List;

public interface IOrderService {

    public List<Orders> findAll(int page,int size) throws Exception;
    public Orders findById(String ordersId) throws Exception;

}
