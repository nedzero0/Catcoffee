package dao.Intf;

import com.Bean.Food;

import java.util.List;

public interface FoodDao {
    //查询所有
    public List<Food> findAll();

    public Food getFood(int id);

    //增加
    public int addFood(Food food);

    //删除
    public int delFood(int id);

    //修改
    public int updateFood(Food food);
}
