package dao.Impl;

import com.Bean.Admin;
import dao.BaseDao;
import dao.Intf.AdminDao;


public class AdminDaoImpl extends BaseDao implements AdminDao {
    @Override
    public Admin findOne(Admin admin) {
        String sql = "SELECT *FROM `admin` WHERE id = ? and password = ?";
        return queryForOne(Admin.class, sql, admin.getId(), admin.getPassword());
    }
}
