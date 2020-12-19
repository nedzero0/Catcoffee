package service.Impl;

import com.Bean.Food;
import dao.Impl.FoodDaoImpl;
import dao.Intf.FoodDao;
import service.FoodService;

import java.util.List;

public class FoodSerImpl implements FoodService {

    FoodDao foodDao = new FoodDaoImpl();

    @Override
    public int addFood(Food food) {
        return foodDao.addFood(food);
    }

    @Override
    public Food getFood(int id) {
        return foodDao.getFood(id);
    }

    @Override
    public int delFood(int id) {
        return foodDao.delFood(id);
    }

    @Override
    public List<Food> showFood() {
        return foodDao.findAll();
    }

    @Override
    public int updateFood(Food food) {
        return foodDao.updateFood(food);
    }
}
