package dao.Impl;

import com.Bean.User;
import dao.BaseDao;
import dao.Intf.UserDao;

import java.util.List;

public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public List<User> findAll() {
        String sql = "SELECT *FROM user";
        return queryForList(User.class, sql);
    }

    @Override
    public User findOne(User user) {
        String sql = "SELECT *FROM `user` WHERE account = ? and password = ?";
        return queryForOne(User.class, sql, user.getAccount(), user.getPassword());
    }

    @Override
    public User findByAccount(String account) {
        String sql = "SELECT *FROM `user` WHERE account = ?";
        return queryForOne(User.class, sql, account);
    }

    @Override
    public User findOneByID(int id) {
        String sql = "SELECT *FROM `user` WHERE id=?";
        return queryForOne(User.class, sql, id);
    }

    @Override
    public String findPass(int id) {
        String sql = "SELECT password FROM `user` WHERE id=?";
        return queryForOne(User.class, sql, id).getPassword();
    }

    @Override
    public int updatePass(int id, String password) {
        String sql = "UPDATE user SET password=? WHERE id=?";
        return update(sql, password, id);
    }

    @Override
    public int addUser(User user) {
        String sql = "INSERT INTO user(account,password,name,phone,sex,age,address,img) VALUES(?,?,?,?,?,?,?,?)";
        return update(sql, user.getAccount(), user.getPassword(), user.getName(),
                user.getPhone(), user.getSex(), user.getAge(), user.getAddress(), user.getImg());
    }

    @Override
    public int delUser(int id) {
        String sql = "DELETE FROM user WHERE id=?";
        return update(sql, id);
    }

    @Override
    public int updateUser(User user) {
        String sql = "UPDATE user SET account=?,password=?,name=?,phone=?,sex=?,age=?,address=?,img=? WHERE id=?";
        return update(sql, user.getAccount(), user.getPassword(), user.getName(),
                user.getPhone(), user.getSex(), user.getAge(), user.getAddress(), user.getImg(), user.getId());
    }
}
