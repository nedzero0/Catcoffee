package service.Impl;

import com.Bean.Orders;
import dao.Impl.OrdersDaoImpl;
import dao.Intf.OrdersDao;
import service.OrdersService;

import java.util.List;

public class OrdersSerImpl implements OrdersService {

    OrdersDao ordersDao = new OrdersDaoImpl();

    @Override
    public List<Orders> findAll() {
        return ordersDao.findAll();
    }

    @Override
    public int delOrders() {
        return 0;
    }

    @Override
    public int addOrders(Orders orders) {
        return 0;
    }

    @Override
    public int updateOrders(Orders orders) {
        return 0;
    }

    @Override
    public Orders findOne(int id) {
        return ordersDao.findOne(id);
    }
}
