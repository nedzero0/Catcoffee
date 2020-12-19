package dao.Intf;

import com.Bean.Dinnertable;

import java.util.List;

public interface DinnertableDao {
    //查询所有
    public List<Dinnertable> queryAll();

    //增加
    public int addDinnertable(String name);

    //删除
    public int delDinnertable(int id);

    //修改
    public int updateDinnertable(Dinnertable dint);

    //查询空闲的桌子
    public List<Dinnertable> queryFree();

    //设置桌子预定时间和状态
    public int setStu(int stu, String time);

}
