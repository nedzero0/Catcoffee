package servlet;


import com.Bean.Dinnertable;
import com.google.gson.Gson;
import dao.Impl.OrdersDaoImpl;
import dao.Intf.OrdersDao;
import service.DinnerTaService;
import service.Impl.DinnerTaSerImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/dinTaServlet")
public class DinnerTaServlet extends BaseServlet {
    DinnerTaService dinnerTa = new DinnerTaSerImpl();

    protected void addDinnerTa(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dinnerName = req.getParameter("dinnerName");
        dinnerTa.addDinner(dinnerName);
        // resp.sendRedirect("H-ui.admin.page/ad-dinnerTaShow.jsp");
        showDinnerTaAll(req, resp);
    }

    protected void delDinnerTa(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int dinnerId = Integer.parseInt(req.getParameter("dinnerId"));
        dinnerTa.delDinnerOne(dinnerId);
        //showDinnerTaAll(req,resp);
        Gson gson = new Gson();
        String json = gson.toJson("ssss");
        resp.getWriter().write(json);
    }

    protected void updateDinnerTa(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    protected void updateDinnerTaStus(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int dinnerId = Integer.parseInt(req.getParameter("dinnerId"));
        Dinnertable dinnertable = new Dinnertable(dinnerId, 0, null);
        int chageStus = dinnerTa.updateDinner(dinnertable);

        Map<String, Integer> map = new HashMap<>();
        map.put("chageStus", chageStus);

        Gson gson = new Gson();
        String json = gson.toJson(map);
        resp.getWriter().write(json);
    }

    protected void showDinnerTaAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Dinnertable> list = dinnerTa.showDinnerAll();
        req.setAttribute("dinnerTaList", list);
        //req.getSession().setAttribute("dinnerTaList",list);
        //resp.sendRedirect("H-ui.admin.page/ad-dinnerTaShow.jsp");
        req.getRequestDispatcher("H-ui.admin.page/ad-dinnerTaShow.jsp").forward(req, resp);
    }

    //显示空闲的桌子
    protected void showFreeDinner(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Dinnertable> list = dinnerTa.queryFree();

        req.getSession().setAttribute("freeDinner", list);
        //req.getSession().setAttribute("dinnerTaList",list);
        //resp.sendRedirect("H-ui.admin.page/ad-dinnerTaShow.jsp");
        resp.sendRedirect("pages/chooseTime.jsp");
    }


    //添加餐桌预定时间，和订单里的预约时间
    protected void addTime(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //找到餐桌id
        int dinnerID = Integer.parseInt(req.getParameter("dinnerID"));
        //根据用户的id查找到订单id
        int userId = Integer.parseInt(req.getParameter("userID"));
        OrdersDao ordersDao = new OrdersDaoImpl();
        //订单id
        int orderId = ordersDao.findIdByUserID(userId);
        //设置时间
        String time = req.getParameter("time1") + " " + req.getParameter("time2");
        System.out.println(time);
        Dinnertable dinnertable = new Dinnertable(dinnerID, 1, time);
        //设置时间和餐桌id
        dinnerTa.updateDinner(dinnertable);
        ordersDao.updateTime(dinnerID, time, orderId);

        Map<String, Integer> map = new HashMap<>();
        map.put("resultCode", 200);
        Gson gson = new Gson();
        String json = gson.toJson(map);
        resp.getWriter().write(json);
    }

}
