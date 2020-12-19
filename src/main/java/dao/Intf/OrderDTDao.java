package dao.Intf;

import com.Bean.Orderdetail;

public interface OrderDTDao {

    //根据订单id和商品id查看是否该订单下有相同订单商品
    public Orderdetail findOD(int orderId, int foodId);

    //如果该订单下有这个商品，更新该订单下的商品的  数量
    public int updateOD(int count, int orderId, int foodId);

    //该订单下没有这个商品，添加
    public int addFood(int orderId, int foodId);

    //删除该订单下的一个商品
    public int delFood(int id);


}
