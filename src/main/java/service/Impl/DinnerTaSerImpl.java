package service.Impl;

import com.Bean.Dinnertable;
import dao.Impl.DinnertableDaoImpl;
import dao.Intf.DinnertableDao;
import service.DinnerTaService;

import java.util.List;

public class DinnerTaSerImpl implements DinnerTaService {

    DinnertableDao dinner = new DinnertableDaoImpl();

    @Override
    public int addDinner(String name) {
        return dinner.addDinnertable(name);
    }

    @Override
    public int delDinnerOne(int id) {
        return dinner.delDinnertable(id);
    }

    @Override
    public List<Dinnertable> showDinnerAll() {
        return dinner.queryAll();
    }

    @Override
    public int updateDinner(Dinnertable dinnertable) {
        return dinner.updateDinnertable(dinnertable);
    }

    @Override
    public List<Dinnertable> queryFree() {
        return dinner.queryFree();
    }

    @Override
    public int setStu(int stu, String time) {
        return 0;
    }
}
