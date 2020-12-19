package service;

import com.Bean.Dinnertable;


import java.util.List;

public interface DinnerTaService {
    //添加桌子
    public int addDinner(String name);

    //删除一个桌子，根据id
    public int delDinnerOne(int id);

    //显示所有桌子
    public List<Dinnertable> showDinnerAll();

    //更改桌子
    public int updateDinner(Dinnertable dinnertable);

    //查询空闲的桌子
    public List<Dinnertable> queryFree();

    //设置桌子预定时间和状态
    public int setStu(int stu, String time);


}
