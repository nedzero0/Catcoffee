package service;

import com.Bean.User;

import java.util.List;

public interface UserService {
    //注册用户
    public void registUser(User user);

    //登录
    public User login(User user);

    //按id查找
    public User findOneByID(int id);

    //账户是否可用
    public boolean existAccount(String name);

    //显示所有用户
    public List<User> showUserAll();

    //删除一个用户，根据id
    public int delUserOne(int id);

    //更改用户
    public int updateUser(User user);
}
