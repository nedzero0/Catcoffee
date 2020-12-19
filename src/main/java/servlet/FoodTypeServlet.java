package servlet;

import com.Bean.Dinnertable;
import com.Bean.FoodType;
import com.google.gson.Gson;
import service.FoodTypeService;
import service.Impl.FoodTypeSerImpl;
import utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/foodTypeServlet")
public class FoodTypeServlet extends BaseServlet {
    FoodTypeService foodTypeService = new FoodTypeSerImpl();

    protected void showFoodTypeAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<FoodType> list = foodTypeService.showFoodType();
        req.setAttribute("foodTypeList", list);
        req.getRequestDispatcher("H-ui.admin.page/ad-foodTypeShow.jsp").forward(req, resp);
    }

    protected void addFoodType(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        foodTypeService.addFoodType(name);
        showFoodTypeAll(req, resp);
    }

    protected void delFoodType(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int delFoodType = foodTypeService.delFoodType(id);
        System.out.println(delFoodType);

        Map<String, Integer> map = new HashMap<>();
        map.put("delFoodType", delFoodType);

        Gson gson = new Gson();
        String json = gson.toJson(map);
        resp.getWriter().write(json);

    }

    protected void updateFoodType(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FoodType foodType = WebUtils.copyParamToBean(req.getParameterMap(), new FoodType());
        System.out.println(foodType);
        foodTypeService.updateFoodType(foodType);
        showFoodTypeAll(req, resp);
    }
}
