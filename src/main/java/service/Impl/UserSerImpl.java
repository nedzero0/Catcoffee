package service.Impl;

import com.Bean.User;
import dao.Impl.UserDaoImpl;
import dao.Intf.UserDao;
import service.UserService;

import java.util.List;

public class UserSerImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public void registUser(User user) {
        userDao.addUser(user);
    }

    @Override
    public User login(User user) {
        return userDao.findOne(user);
    }

    @Override
    public User findOneByID(int id) {
        return userDao.findOneByID(id);
    }

    @Override
    public boolean existAccount(String account) {
        if (userDao.findByAccount(account) == null) {
            return true;
        }
        return false;
    }

    @Override
    public List<User> showUserAll() {
        return userDao.findAll();
    }

    @Override
    public int delUserOne(int id) {
        return userDao.delUser(id);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }
}
