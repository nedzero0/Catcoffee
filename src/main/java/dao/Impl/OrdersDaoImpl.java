package dao.Impl;

import com.Bean.Orderdetail;
import com.Bean.Orders;
import dao.BaseDao;
import dao.Intf.OrdersDao;

import java.util.List;

public class OrdersDaoImpl extends BaseDao implements OrdersDao {
    @Override
    public List<Orders> findAll() {
        String sql = "SELECT orders.*,`user`.`name`,dinnertable.tableName FROM orders,user,dinnertable\n" +
                "WHERE orders.orderUser = `user`.id AND orders.table_id = dinnertable.id";
        return queryForList(Orders.class, sql);
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
    public List<Orderdetail> findDetails(int i) {
        String sql = "SELECT ord.*,food.foodName,food.price*ord.foodCount totalPrice \n" +
                "FROM orderdetail ord,food\n" +
                "WHERE ord.food_id = food.id AND ord.orderId = ?";
        return queryForList(Orderdetail.class, sql, i);
    }

    @Override
    public Orders findOne(int id) {
      /*  String sql = "SELECT orders.*,`user`.`name`,dinnertable.tableName FROM orders,user,dinnertable\n" +
                "WHERE orders.orderUser = `user`.id AND orders.table_id = dinnertable.id AND orders.orderUser=?";*/
        String sql = "SELECT orders.*,`user`.`name` FROM orders,`user`\n" +
                "WHERE orders.orderUser = `user`.id  AND orders.orderUser=?";
        return queryForOne(Orders.class, sql, id);
    }

    @Override
    public int findIdByUserID(int id) {
        String sql = "SELECT orders.id FROM `user`,orders\n" +
                "WHERE `user`.id = orders.orderUser and `user`.id=?";
        return queryForOne(Orders.class, sql, id).getId();
    }

    @Override
    public int allPrice(int ordersId) {
      /*  String sql = "SELECT SUM(food.price*ord.foodCount) totalPrice \n" +
                "FROM orderdetail ord,food\n" +
                "WHERE ord.food_id = food.id AND ord.orderId = ?";*/
        String sql = "UPDATE orders SET totalPrice = (\n" +
                "SELECT SUM(food.price*ord.foodCount)\n" +
                "FROM orderdetail ord,food\n" +
                "WHERE ord.food_id = food.id AND ord.orderId = ?\n" +
                ")\n" +
                "WHERE orders.id = ?";

        return update(sql, ordersId, ordersId);
    }

    @Override
    public int setPay(int id) {
        String sql = "UPDATE orders SET orderStatus = 1 \n" +
                "WHERE id=?";
        return update(sql, id);
    }

    @Override
    public int updateTime(int dinnerID, String time, int id) {
        String sql = "UPDATE orders SET table_id=?,orderDate = ? WHERE id = ?";
        return update(sql, dinnerID, time, id);
    }

    @Override
    public int clearOrders(Orders orders) {
        //清空订单下的商品
        String sql = "DELETE FROM orderdetail WHERE orderId = ?";
        update(sql, orders.getId());
        //清空订单下的餐桌的状态和时间
        String sql1 = "UPDATE dinnertable SET tableStatus = 0,orderDate=NULL WHERE id=?";
        update(sql1, orders.getTable_id());

        //清空订单，除了用户以外的其它
        String sql2 = "UPDATE orders SET table_id=NULL,orderDate = NULL,totalPrice=NULL,orderStatus=0 WHERE id = ?";
        return update(sql2, orders.getId());
    }
}
