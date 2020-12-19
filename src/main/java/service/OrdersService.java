package service;

import com.Bean.Orders;

import java.util.List;

public interface OrdersService {
    //查看订单
    public List<Orders> findAll();

    //删除订单
    public int delOrders();

    //添加订单
    public int addOrders(Orders orders);

    //修改订单
    public int updateOrders(Orders orders);

    //查看一个订单
    public Orders findOne(int id);

}
