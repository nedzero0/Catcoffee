package dao.Intf;


import com.Bean.Admin;

public interface AdminDao {
    //查：按id和密码登录
    public Admin findOne(Admin admin);
}
