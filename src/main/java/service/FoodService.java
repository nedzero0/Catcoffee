package service;

import com.Bean.Dinnertable;
import com.Bean.Food;

import java.util.List;

public interface FoodService {
    //添加food
    public int addFood(Food food);

    public Food getFood(int id);

    //删除一个food，根据id
    public int delFood(int id);

    //显示所有food
    public List<Food> showFood();

    //更改food
    public int updateFood(Food food);
}
