package servlet;

import com.Bean.Food;
import com.Bean.FoodType;
import com.Bean.User;
import com.google.gson.Gson;
import service.FoodService;
import service.FoodTypeService;
import service.Impl.FoodSerImpl;
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

@WebServlet("/foodServlet")
public class FoodServlet extends BaseServlet {

    FoodService foodService = new FoodSerImpl();


    protected void showFoodAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Food> list = foodService.showFood();
        req.setAttribute("foodList", list);
        req.getRequestDispatcher("H-ui.admin.page/ad-foodShow.jsp").forward(req, resp);
    }

    protected void showFoodOfUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Food> list = foodService.showFood();
        req.setAttribute("foodList", list);
        req.getRequestDispatcher("pages/commodity.jsp").forward(req, resp);
    }


    protected void addFood(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Food food = WebUtils.copyParamToBean(req.getParameterMap(), new Food());
        FoodTypeService foodTypeService = new FoodTypeSerImpl();
        String typeName = foodTypeService.findNameById(food.getFoodType_id());
        food.setTypeName(typeName);
        System.out.println(food);
        foodService.addFood(food);
        showFoodAll(req, resp);
    }

    protected void delFood(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int delFood = foodService.delFood(id);
        System.out.println(delFood);

        Map<String, Integer> map = new HashMap<>();
        map.put("delFood", delFood);

        Gson gson = new Gson();
        String json = gson.toJson(map);
        resp.getWriter().write(json);

    }

    protected void updateFood(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //System.out.println("222222222222");
        Food food = WebUtils.copyParamToBean(req.getParameterMap(), new Food());
        FoodTypeService foodTypeService = new FoodTypeSerImpl();
        String typeName = foodTypeService.findNameById(food.getFoodType_id());
        food.setTypeName(typeName);
        //System.out.println(food);

        foodService.updateFood(food);
        showFoodAll(req, resp);


    }

    protected void getFood(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // System.out.println("33333");
        int id = Integer.parseInt(req.getParameter("id"));
        //System.out.println(id);
        Food food = foodService.getFood(id);
        //System.out.println(food);
        req.setAttribute("food", food);
        req.getRequestDispatcher("H-ui.admin.page/ad-foodAdd.jsp").forward(req, resp);
    }


}
