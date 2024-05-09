package edu.poly.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.dao.UserDao;
import edu.poly.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		Cookie[] listCookie = req.getCookies();
		String username = "";
		String matKhau = "";
		String luuTK = "";
		int co = 0;
		if (listCookie != null) {
			while (co < listCookie.length) {
				if (listCookie[co].getName().equals("username")) {
					username = listCookie[co].getValue();

				}
				if (listCookie[co].getName().equals("matKhau")) {
					matKhau = listCookie[co].getValue();

				}
				if (listCookie[co].getName().equals("luuTK")) {
					luuTK = listCookie[co].getValue();
				}
				co++;
			}
		}

		req.setAttribute("username", username);
		req.setAttribute("matKhau", matKhau);
		req.setAttribute("luuTK", luuTK);
		req.getRequestDispatcher("/admin/common/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String matKhau = request.getParameter("matKhau");
		int i = 0;
		
		if (i == 0) {
			if (username.isEmpty()) {
				doFill(request, response);
				request.setAttribute("backround", "danger");
				request.setAttribute("message", "Vui lòng nhập tên đăng nhập!");
				request.setAttribute("show", "true");
			} else {
				doFill(request, response);
				i++;
			}
		}
		if (i == 1) {
			if (matKhau.isEmpty()) {
				doFill(request, response);
				request.setAttribute("backround", "danger");
				request.setAttribute("message", "Vui lòng nhập mật khẩu!");
				request.setAttribute("show", "true");
			} else {
				doFill(request, response);
				i++;
			}
		}
		if (i == 2) {
			UserDao dao= new UserDao();
			User entity = new User();
			entity = dao.findById(username);

			if (entity == null) {
				doFill(request, response);
				request.setAttribute("backround", "danger");
				request.setAttribute("message", "Tài khoản không đúng !");
				request.setAttribute("show", "true");
			} else {
				if (matKhau.equals(entity.getMatKhau()) == false) {
					doFill(request, response);
					request.setAttribute("backround", "danger");
					request.setAttribute("message", "Mật khẩu không đúng !");
					request.setAttribute("show", "true");
				} else {

					request.getSession().setAttribute("taiKhoan", username);
					Cookie user = new Cookie("username", username);
					Cookie password = new Cookie("matKhau", matKhau);
					Cookie remember = new Cookie("luuTK", "true");

					if (request.getParameter("luuTK") != null) {
						user.setMaxAge(60*60*24);
						password.setMaxAge(60*60*24);
						remember.setMaxAge(60*60*24);
					} else {
						user.setMaxAge(0);
						password.setMaxAge(0);
						remember.setMaxAge(0);
					}
					response.addCookie(user);
					response.addCookie(password);
					response.addCookie(remember);
					if(entity.isAdmin()) {
//						resp.sendRedirect("/Assignment_JAVA/admin/videos/video.jsp");
						response.sendRedirect("/Assignment_JAVA/admin");
					}
					else {
						response.sendRedirect("/Assignment_JAVA/index");
					}					
				}
			}
		}
		try {
			request.getRequestDispatcher("/admin/common/login.jsp").forward(request, response);
		} catch (Exception e) {

		}
	}

	private void doFill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String matKhau = request.getParameter("matKhau");

		Boolean luuTK = Boolean.valueOf(request.getParameter("luuTK"));
		request.setAttribute("username", username);
		request.setAttribute("matKhau", matKhau);
		request.setAttribute("luuTK", luuTK);
	}

}
