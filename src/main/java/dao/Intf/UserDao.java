package dao.Intf;

import com.Bean.FoodType;
import com.Bean.User;


import java.util.List;

public interface UserDao {
    //查询所有
    public List<User> findAll();

    //按账户名和密码登录
    public User findOne(User user);

    //查看账户名是否存在
    public User findByAccount(String account);

    //按id查找
    public User findOneByID(int id);

    //根据id查找密码
    public String findPass(int id);

    //根据id修改密码
    public int updatePass(int id, String password);

    //增加
    public int addUser(User user);

    //删除
    public int delUser(int id);

    //修改
    public int updateUser(User user);
}
