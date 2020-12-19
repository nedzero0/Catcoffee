package service.Impl;

import com.Bean.Admin;
import dao.Impl.AdminDaoImpl;
import dao.Intf.AdminDao;
import service.AdminService;

public class AdminSerImpl implements AdminService {

    AdminDao adminDao = new AdminDaoImpl();

    @Override
    public Admin login(Admin admin) {
        return adminDao.findOne(admin);
    }
}
