package dao.Intf;

import com.Bean.Food;
import com.Bean.FoodType;

import java.util.List;

public interface FoodTypeDao {
    //查询所有
    public List<FoodType> findAll();

    //增加
    public int addfoodType(String name);

    //删除
    public int delfoodType(int id);

    //修改
    public int updatefoodType(FoodType foodType);

    //通过typeName查找id
    public int findIdByname(String typeName);

    //通过id查找typeName
    public String findNameById(int id);


}
