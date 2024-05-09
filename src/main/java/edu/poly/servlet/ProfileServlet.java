package edu.poly.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.dao.UserDao;
import edu.poly.entity.User;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = (String) request.getSession().getAttribute("taiKhoan");
        UserDao dao = new UserDao();
        User user = dao.findById(id);
        request.setAttribute("user", user);
		request.getRequestDispatcher("admin/common/editprofile.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			String id = (String) request.getSession().getAttribute("taiKhoan");
			UserDao dao = new UserDao();
			User user = dao.findById(id);
			BeanUtils.populate(user, request.getParameterMap());

			dao.create(user);
			request.setAttribute("message", "User inserted!!");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
		request.getRequestDispatcher("admin/common/editprofile.jsp").forward(request, response);

	}

}
