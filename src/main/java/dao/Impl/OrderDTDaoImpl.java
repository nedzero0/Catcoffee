package dao.Impl;

import com.Bean.Orderdetail;
import dao.BaseDao;
import dao.Intf.OrderDTDao;

public class OrderDTDaoImpl extends BaseDao implements OrderDTDao {
    @Override
    public Orderdetail findOD(int orderId, int foodId) {
        String sql = "SELECT *FROM orderdetail WHERE orderId = ? AND food_id =?";
        return queryForOne(Orderdetail.class, sql, orderId, foodId);
    }

    @Override
    public int updateOD(int count, int orderId, int foodId) {
        String sql = "UPDATE orderdetail SET foodCount = ?\n" +
                "WHERE orderId = ? AND food_id = ?";
        return update(sql, count, orderId, foodId);
    }

    @Override
    public int addFood(int orderId, int foodId) {
        String sql = "INSERT INTO orderdetail(orderId,food_id,foodCount) VALUES(?,?,1)";
        return update(sql, orderId, foodId);
    }

    @Override
    public int delFood(int id) {
        String sql = "DELETE FROM orderdetail WHERE id=?";
        return update(sql, id);
    }
}
