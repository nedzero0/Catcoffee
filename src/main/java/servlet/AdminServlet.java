package servlet;

import com.Bean.Admin;
import dao.Impl.AdminDaoImpl;
import dao.Intf.AdminDao;
import servlet.BaseServlet;
import utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

@WebServlet("/adminServlet")
public class AdminServlet extends BaseServlet {

    AdminDao adminDao = new AdminDaoImpl();

    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 获取 Session 中的验证码
        String token = (String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        // 删除 Session 中的验证码
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);
        String code = req.getParameter("code");

        System.out.println(code);
        Admin admin = WebUtils.copyParamToBean(req.getParameterMap(), new Admin());
        Admin one = adminDao.findOne(admin);
        System.out.println(one);
        if (one != null && token.equalsIgnoreCase(code)) {
            req.getSession().setAttribute("admin", one);
            resp.sendRedirect("H-ui.admin.page/admin-index.jsp");
        } else {
            System.out.println("账号密码错误，请重新输入");
            req.getRequestDispatcher("H-ui.admin.page/login.jsp").forward(req, resp);
        }

    }
}
