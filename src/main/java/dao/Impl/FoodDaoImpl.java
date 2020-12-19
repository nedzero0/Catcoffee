package dao.Impl;

import com.Bean.Food;
import dao.BaseDao;
import dao.Intf.FoodDao;

import java.util.List;

public class FoodDaoImpl extends BaseDao implements FoodDao {
    @Override
    public List<Food> findAll() {
        /*   String sql="SELECT *FROM food";*/
        String sql = "SELECT food.* ,foodtype.typeName FROM food,foodtype\n" +
                "WHERE food.foodType_id = foodtype.id";
        return queryForList(Food.class, sql);
    }

    @Override
    public Food getFood(int id) {
        String sql = "SELECT food.*,foodtype.typeName FROM food,foodtype\n" +
                "WHERE food.foodType_id = foodtype.id \n" +
                "and food.id = ?";
        return queryForOne(Food.class, sql, id);
    }

    @Override
    public int addFood(Food food) {
        String sql = "INSERT INTO food(foodName,foodType_id,price,remark,popularity,comment,img)" +
                " VALUES(?,?,?,?,?,?,?)";
        return update(sql, food.getFoodName(), food.getFoodType_id(), food.getPrice(),
                food.getRemark(), food.getPopularity(), food.getComment(), food.getImg());
    }

    @Override
    public int delFood(int id) {
        String sql = "DELETE FROM food WHERE id=?";
        return update(sql, id);
    }

    @Override
    public int updateFood(Food food) {
        String sql = "UPDATE food SET foodName=?,foodType_id=?,price=?," +
                "remark=?,popularity=?,comment=?,img=? WHERE id=?";
        return update(sql, food.getFoodName(), food.getFoodType_id(), food.getPrice(),
                food.getRemark(), food.getPopularity(), food.getComment(), food.getImg(), food.getId());
    }
}
