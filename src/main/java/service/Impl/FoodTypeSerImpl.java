package service.Impl;

import com.Bean.FoodType;
import dao.Impl.FoodTypeDaoImpl;
import dao.Intf.FoodTypeDao;
import service.FoodTypeService;

import java.util.List;

public class FoodTypeSerImpl implements FoodTypeService {

    FoodTypeDao foodTypeDao = new FoodTypeDaoImpl();

    @Override
    public int addFoodType(String name) {
        return foodTypeDao.addfoodType(name);
    }

    @Override
    public int delFoodType(int id) {
        return foodTypeDao.delfoodType(id);
    }

    @Override
    public List<FoodType> showFoodType() {
        return foodTypeDao.findAll();
    }

    @Override
    public int updateFoodType(FoodType foodType) {
        return foodTypeDao.updatefoodType(foodType);
    }

    @Override
    public int findIdByname(String typeName) {
        return foodTypeDao.findIdByname(typeName);
    }

    @Override
    public String findNameById(int id) {
        return foodTypeDao.findNameById(id);
    }
}
