import com.Bean.*;
import dao.Impl.*;
import dao.Intf.*;
import service.DinnerTaService;
import service.FoodService;
import service.FoodTypeService;
import service.Impl.DinnerTaSerImpl;
import service.Impl.FoodSerImpl;
import service.Impl.FoodTypeSerImpl;
import service.Impl.OrdersSerImpl;
import service.OrdersService;


import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;


public class test {
    public static void main(String[] args) {
        Date date = new Date();
        SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //System.out.println(dft.format(System.currentTimeMillis()));
        String str = dft.format(date);
        System.out.println(str);

        OrdersDao ordersDao = new OrdersDaoImpl();
        int i = ordersDao.allPrice(2);
        System.out.println(i);


    }
}
