package servlet;

import com.Bean.Orderdetail;
import com.Bean.Orders;
import com.Bean.User;
import com.google.gson.Gson;
import dao.Impl.OrderDTDaoImpl;
import dao.Impl.OrdersDaoImpl;
import dao.Intf.OrderDTDao;
import dao.Intf.OrdersDao;
import service.Impl.OrdersSerImpl;
import service.OrdersService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/ordersServlet")
public class OrdersServlet extends BaseServlet {
    OrdersService ordersService = new OrdersSerImpl();
    OrdersDao ordersDao = new OrdersDaoImpl();
    OrderDTDao orderDTDao = new OrderDTDaoImpl();

    protected void showOrdersAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Orders> list = ordersService.findAll();
        req.setAttribute("ordersList", list);
        req.getRequestDispatcher("H-ui.admin.page/ad-ordersShow.jsp").forward(req, resp);
    }


    protected void orderDetails(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        System.out.println(id);
        OrdersDao ordersDao = new OrdersDaoImpl();
        List<Orderdetail> list = ordersDao.findDetails(id);
        System.out.println(list);
        req.setAttribute("orderDetailsList", list);
        req.getRequestDispatcher("H-ui.admin.page/ad-orderDetails.jsp").forward(req, resp);
    }

    //订单详情
    protected void userOrderDTs(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId = Integer.parseInt(req.getParameter("userId"));
        //订单id
        int id = ordersDao.findIdByUserID(userId);
        System.out.println(id);

        List<Orderdetail> list = ordersDao.findDetails(id);
        //System.out.println(list);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", 0);
        map.put("count", 1000);
        map.put("data", list);

        //System.out.println(map);
        // req.setAttribute("orderDetailsList",list);
        Gson gson = new Gson();
        String json = gson.toJson(map);
        resp.getWriter().write(json);
        //System.out.println(json);
    }

    //用户订单
    protected void userOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("sssss");
        int id = Integer.parseInt(req.getParameter("userId"));

        Orders userOrder = ordersService.findOne(id);
        System.out.println(userOrder);
        req.getSession().setAttribute("OrdersId", userOrder.getId());

        if (userOrder.getOrderStatus() > 0) {
            userOrder.setStrStatus("已支付");
        } else {
            userOrder.setStrStatus("未支付");
        }
        List<Orders> list = new ArrayList<>();
        list.add(userOrder);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", 0);
        map.put("count", 1000);
        map.put("data", list);
        // System.out.println(map);
        // req.setAttribute("orderDetailsList",list);
        Gson gson = new Gson();
        String json = gson.toJson(map);
        resp.getWriter().write(json);
        System.out.println(json);

    }

    //添加商品
    protected void addOrderDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // System.out.println("ooooo0.0");
        int foodId = Integer.parseInt(req.getParameter("foodID"));
        //System.out.println(foodId);

        //根据用户的id查找到订单id
        int userId = Integer.parseInt(req.getParameter("userID"));
        //System.out.println(userId);
        //订单id
        int orderId = ordersDao.findIdByUserID(userId);
        //根据订单id和商品id查看是否该订单下有相同订单商品
        Orderdetail od = orderDTDao.findOD(orderId, foodId);
        System.out.println(od);
        if (od != null) {
            od.setFoodCount(od.getFoodCount() + 1);
            //更新Orderdetail的数量
            orderDTDao.updateOD(od.getFoodCount(), orderId, foodId);
            //更新订单的总消费
            ordersDao.allPrice(orderId);
        } else {
            //添加新商品进入订单
            orderDTDao.addFood(orderId, foodId);
            //更新订单的总消费
            ordersDao.allPrice(orderId);
        }
        System.out.println("eeeee");
    }

    //删除商品
    protected void delOrderDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ooooooo0.0.0.00.0");
        int id = Integer.parseInt(req.getParameter("id"));

        //根据用户的id查找到订单id
        int userId = Integer.parseInt(req.getParameter("userID"));
        //System.out.println(userId);
        //订单id
        int orderId = ordersDao.findIdByUserID(userId);

        //删除要删除的商品
        orderDTDao.delFood(id);
        //更新订单的总消费
        ordersDao.allPrice(orderId);
    }

    //支付订单
    protected void payOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ppppp");
        int id = Integer.parseInt(req.getParameter("id"));
        System.out.println(id);
        ordersDao.setPay(id);
    }

    //清空订单
    protected void clearOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //根据用户的id查找到订单id
        int userId = Integer.parseInt(req.getParameter("userID"));
        //订单id
        int orderId = ordersDao.findIdByUserID(userId);
        //订单对象
        Orders ordersDaoOne = ordersDao.findOne(orderId);
        System.out.println(ordersDaoOne);
        //清空订单
        int i = ordersDao.clearOrders(ordersDaoOne);

        Map<String, Integer> map = new HashMap<>();
        map.put("clearOrder", i);

        Gson gson = new Gson();
        String json = gson.toJson(map);
        resp.getWriter().write(json);

    }
}
