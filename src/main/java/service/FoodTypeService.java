package service;


import com.Bean.FoodType;

import java.util.List;

public interface FoodTypeService {
    //添加foodtype
    public int addFoodType(String name);

    //删除一个foodtype，根据id
    public int delFoodType(int id);

    //显示所有foodtype
    public List<FoodType> showFoodType();

    //更改foodtype
    public int updateFoodType(FoodType foodType);


    //通过typeName查找id
    public int findIdByname(String typeName);

    //通过id查找typeName
    public String findNameById(int id);


}
