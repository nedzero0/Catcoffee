package servlet;

import com.Bean.User;
import com.google.gson.Gson;
import dao.Impl.UserDaoImpl;
import dao.Intf.UserDao;
import service.Impl.UserSerImpl;
import service.UserService;
import utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/userServlet")
public class UserServlet extends BaseServlet {

    UserService userService = new UserSerImpl();
    UserDao userDao = new UserDaoImpl();

    //展示所有user
    protected void showUserAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> list = userService.showUserAll();
        req.setAttribute("userList", list);
        req.getRequestDispatcher("H-ui.admin.page/ad-userShow.jsp").forward(req, resp);
    }

    //删除user
    protected void delUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int delUserResult = userService.delUserOne(id);

        Gson gson = new Gson();
        String json = gson.toJson(delUserResult);
        resp.getWriter().write(json);
    }

    //修改
    protected void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("11111212");
        User user = WebUtils.copyParamToBean(req.getParameterMap(), new User());
        System.out.println(user);
        int updateUser = userService.updateUser(user);
        if (updateUser > 0) {
            User newUser = userService.findOneByID(user.getId());
            req.getSession().setAttribute("Users", newUser);
            resp.sendRedirect("pages/userForm.jsp");
        }
    }

    //修改密码
    protected void updatePass(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("99999");
        int id = Integer.parseInt(req.getParameter("id"));
        String oldPassword = req.getParameter("oldPassword");
        String passWord = req.getParameter("password");
        if (oldPassword.equals(userDao.findPass(id))) {
            userDao.updatePass(id, passWord);
            User newUser = userService.findOneByID(id);
            req.getSession().setAttribute("Users", newUser);
            req.getSession().setAttribute("udPassSuccess", "修改密码失败");
            resp.sendRedirect("pages/userForm.jsp");

        } else {
            System.out.println("密码错误");
            req.getSession().setAttribute("udPassSuccess", "修改密码失败");
            resp.sendRedirect("pages/userForm.jsp");

        }


    }

    //登录
    protected void loginUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = WebUtils.copyParamToBean(req.getParameterMap(), new User());
        User login = userService.login(user);
        System.out.println(login);
        //System.out.println(user);
        if (login != null) {
            req.getSession().setAttribute("Users", login);
            if (login.getSex().equals("男")) {
                req.getSession().setAttribute("sex", 1);
            } else {
                req.getSession().setAttribute("sex", 0);
            }
            resp.sendRedirect("pages/userForm.jsp");
        } else {
            System.out.println("账号密码错误，请重新输入");
            //String s = "账号或者密码错误";
            req.setAttribute("loginErr", "账号或者密码错误");
            req.getRequestDispatcher("pages/userlogin.jsp").forward(req, resp);
        }


    }
}
