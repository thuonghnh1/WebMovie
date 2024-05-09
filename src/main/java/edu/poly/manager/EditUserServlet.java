package edu.poly.manager;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.dao.UserDao;
import edu.poly.dao.VideoDao;
import edu.poly.entity.User;
import edu.poly.entity.Video;

@WebServlet({ "/editUser/index", "/editUser/insert", "/editUser/update", "/editUser/delete", "/editUser/reset", "/editUser/edit" })
public class EditUserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
//		User entity = new User();
//		UserDao dao = new UserDao();
//		List<User> list = new ArrayList();
//		list = dao.findAll();
//		request.setAttribute("list", list);
		String url = request.getRequestURL().toString();
		User user = null;

		if (url.contains("delete")) {
			doDeleteU(request, response);
			user = new User();
			request.setAttribute("user", user);
		}  else if (url.contains("reset")) {
			user = new User();
			request.setAttribute("user", user);
		}else if (url.contains("edit")) {
	        doEdit(request, response);
	    } 
		try {
			findAll(request, response);
			System.out.println(121);

			request.getRequestDispatcher("/admin/users/users.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		findAll(request, response);
//		request.getRequestDispatcher("/admin/users/users.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		if (uri.contains("insert")) {
			doInsert(request, response);
		}
		if (uri.contains("update")) {
			doUpdateU(request, response);
		}
		if (uri.contains("delete")) {
			doDeleteU(request, response);

		}
		if (uri.contains("reset")) {
			request.setAttribute("user", new User());
		}else if (uri.contains("edit")) {
	        doEdit(request, response);
	    } 
		try {
			findAll(request, response);
			request.getRequestDispatcher("/admin/users/users.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		findAll(request, response);
//		request.getRequestDispatcher("/admin/users/users.jsp").forward(request, response);
	}
	protected void doEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id = request.getParameter("username");
			
			UserDao dao = new UserDao();
			User user = dao.findById(id);

			request.setAttribute("user", user);
			request.setAttribute("message", "User edited!!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}
	private void doInsert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());

			UserDao dao = new UserDao();
			dao.create(user);
			request.setAttribute("message", "User inserted!!");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	private void doDeleteU(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id = request.getParameter("username");

			UserDao dao = new UserDao();
			dao.delete(id);
			request.setAttribute("message", "User deleted!!");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
//		response.sendRedirect("/WebMovie/manager/editUser/index");
	}

	private void doUpdateU(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			User user = new User();
			BeanUtils.populate(user, request.getParameterMap());

			UserDao dao = new UserDao();
			dao.update(user);

			request.setAttribute("user", user);
			request.setAttribute("message", "User updated!!");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}
	protected void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			UserDao dao = new UserDao();
			List<User> list = dao.findAll();
			request.setAttribute("users", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}
	
}
