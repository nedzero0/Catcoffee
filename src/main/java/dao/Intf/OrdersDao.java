package dao.Intf;

import com.Bean.Orderdetail;
import com.Bean.Orders;

import java.util.List;

public interface OrdersDao {
    //查看订单
    public List<Orders> findAll();

    //删除订单
    public int delOrders();

    //添加订单
    public int addOrders(Orders orders);

    //修改订单
    public int updateOrders(Orders orders);

    //查看订单下有那些东西
    public List<Orderdetail> findDetails(int i);

    //查看一个订单
    public Orders findOne(int id);

    //根据用户id查看订单id
    public int findIdByUserID(int id);

    //设置订单下的东西的所有费用
    public int allPrice(int ordersId);

    //设置支付状态
    public int setPay(int id);

    //修改订单预约时间
    public int updateTime(int dinnerID, String time, int id);

    //清空订单
    public int clearOrders(Orders orders);

}
