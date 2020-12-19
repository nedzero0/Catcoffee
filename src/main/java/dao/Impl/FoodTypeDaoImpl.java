package dao.Impl;

import com.Bean.FoodType;
import dao.BaseDao;
import dao.Intf.FoodTypeDao;

import java.util.List;

public class FoodTypeDaoImpl extends BaseDao implements FoodTypeDao {
    @Override
    public List<FoodType> findAll() {
        String sql = "SELECT *FROM foodType";
        return queryForList(FoodType.class, sql);
    }

    @Override
    public int addfoodType(String name) {
        String sql = "INSERT INTO foodType(typeName) VALUES(?)";
        return update(sql, name);
    }

    @Override
    public int delfoodType(int id) {
        String sql = "DELETE FROM foodType WHERE id=?";
        return update(sql, id);
    }

    @Override
    public int updatefoodType(FoodType foodType) {
        String sql = "UPDATE foodType SET typeName=? WHERE id=?";
        return update(sql, foodType.getTypeName(), foodType.getId());
    }

    @Override
    public int findIdByname(String typeName) {
        String sql = "SELECT id FROM foodtype WHERE typeName=?";
        FoodType one = queryForOne(FoodType.class, sql, typeName);
        return one.getId();
    }

    @Override
    public String findNameById(int id) {
        String sql = "SELECT typeName FROM foodtype WHERE id=?";
        FoodType one = queryForOne(FoodType.class, sql, id);
        return one.getTypeName();
    }
}
