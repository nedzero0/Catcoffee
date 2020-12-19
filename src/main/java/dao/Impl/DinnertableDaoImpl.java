package dao.Impl;

import com.Bean.Dinnertable;
import dao.BaseDao;
import dao.Intf.DinnertableDao;

import java.util.List;

public class DinnertableDaoImpl extends BaseDao implements DinnertableDao {
    @Override
    public List<Dinnertable> queryAll() {
        String sql = "SELECT *FROM dinnertable";
        return queryForList(Dinnertable.class, sql);
    }

    @Override
    public int addDinnertable(String name) {
        String sql = "INSERT INTO dinnertable(tableName) VALUES(?)";
        return update(sql, name);
    }

    @Override
    public int delDinnertable(int id) {
        String sql = "DELETE FROM dinnertable WHERE id=?";
        return update(sql, id);
    }

    @Override
    public int updateDinnertable(Dinnertable dint) {
        String sql = "UPDATE dinnertable SET tableStatus=?,orderDate=? WHERE id=?";
        return update(sql, dint.getTableStatus(), dint.getOrderDate(), dint.getId());
    }

    @Override
    public List<Dinnertable> queryFree() {
        String sql = "SELECT *FROM dinnertable where tableStatus=0";
        return queryForList(Dinnertable.class, sql);
    }

    @Override
    public int setStu(int stu, String time) {
        String sql = "";
        return 0;
    }
}
