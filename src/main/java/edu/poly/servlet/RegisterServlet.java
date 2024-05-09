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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/admin/common/registration.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		String username = req.getParameter("username");
		String fullname = req.getParameter("fullname");
		String Email = req.getParameter("email");
		String matKhau = req.getParameter("matKhau");
		String xacNhan = req.getParameter("xacNhan");
		String dieuKhoan = req.getParameter("dieuKhoan");

		int i = 0;
		if (i == 0) {
			if (fullname.isEmpty()) {
				doFill(req, resp);
				req.setAttribute("background", "danger");
				req.setAttribute("message", "Tên không được bỏ trống!");
				req.setAttribute("show", "true");
			} else {
				doFill(req, resp);
				i++;
			}
		}
		if (i == 1) {
			if (username.isEmpty()) {
				doFill(req, resp);
				req.setAttribute("background", "danger");
				req.setAttribute("message", "Tên đăng nhập không được bỏ trống!");
				req.setAttribute("show", "true");
			} else {
				if (username.length() < 6 || username.length() > 15) {
					doFill(req, resp);
					req.setAttribute("background", "danger");
					req.setAttribute("message", "Tên đăng nhập phải từ 6-15 ký tự!");
					req.setAttribute("show", "true");
				} else {
					UserDao dao= new UserDao();
					User entity = new User();
					entity = dao.findById(username);
					if (entity != null) {
						doFill(req, resp);
						req.setAttribute("background", "danger");
						req.setAttribute("message", "Tên đăng nhập đã tồn tại!");
						req.setAttribute("show", "true");
					} else {
						doFill(req, resp);
						i++;
					}
				}
			}
		}
		if (i == 2) {
			if (Email.isEmpty()) {
				doFill(req, resp);
				req.setAttribute("background", "danger");
				req.setAttribute("message", "Email không được bỏ trống!");
				req.setAttribute("show", "true");
			} else {
				String remail = "\\w+@\\w+\\.\\w+";
				if (Email.matches(remail) == false) {
					doFill(req, resp);
					req.setAttribute("background", "danger");
					req.setAttribute("message", "Email không đúng định dạng!");
					req.setAttribute("show", "true");
				} else {
					doFill(req, resp);
					i++;
				}
			}
		}
		if (i == 3) {
			if (matKhau.isEmpty()) {
				doFill(req, resp);
				req.setAttribute("background", "danger");
				req.setAttribute("message", "Mật khẩu không được bỏ trống!");
				req.setAttribute("show", "true");
			} else {
				if (matKhau.length() < 7) {
					doFill(req, resp);
					req.setAttribute("background", "danger");
					req.setAttribute("message", "Mật khẩu ít nhất 7 ký tự!");
					req.setAttribute("show", "true");
				} else {
					doFill(req, resp);
					i++;
				}

			}
		}
		if (i == 4) {
			if (xacNhan.isEmpty()) {
				doFill(req, resp);
				req.setAttribute("background", "danger");
				req.setAttribute("message", "Xác nhận mật khẩu không được bỏ trống!");
				req.setAttribute("show", "true");
			} else {
				if (xacNhan.equals(matKhau) == false) {
					doFill(req, resp);
					req.setAttribute("background", "danger");
					req.setAttribute("message", "Xác nhận mật khẩu không khớp!");
					req.setAttribute("show", "true");
				} else {
					doFill(req, resp);
					i++;
				}
			}
		}
		if (i == 5) {
			if (dieuKhoan == null) {
				doFill(req, resp);
				req.setAttribute("background", "danger");
				req.setAttribute("message", "Vui lòng xác nhận điều khoản!");
				req.setAttribute("show", "true");
			} else {
				doFill(req, resp);
				i++;
			}
		}
		if (i == 6) {
			try {
				UserDao dao= new UserDao();
				User entity = new User();
				doFill(req, resp);
				BeanUtils.populate(entity, req.getParameterMap());

				dao.create(entity);
				req.setAttribute("background", "success");
				req.setAttribute("message", "Tạo tài khoản thành công!");
				req.setAttribute("show", "true");
//				resp.sendRedirect("/admin/common/login.jsp");
				resp.sendRedirect(req.getContextPath() + "/admin/common/login.jsp");

				
			} catch (Exception e) {
				req.setAttribute("background", "danger");
				req.setAttribute("message", "Thêm mới thất bại!");
				req.setAttribute("show", "true");
			}

		}
		try {
			req.getRequestDispatcher("/admin/common/registration.jsp").forward(req, resp);
		} catch (Exception e) {

		}
	}

	private void doFill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String username = req.getParameter("username");
		String fullname = req.getParameter("fullname");
		String Email = req.getParameter("email");
		String matKhau = req.getParameter("matKhau");
		String xacNhan = req.getParameter("xacNhan");
		boolean dieuKhoan = Boolean.valueOf(req.getParameter("dieuKhoan"));

		req.setAttribute("username", username);
		req.setAttribute("fullname", fullname);
		req.setAttribute("Email", Email);
		req.setAttribute("matKhau", matKhau);
		req.setAttribute("xacNhan", xacNhan);
		req.setAttribute("dieuKhoan", dieuKhoan);
	}


}
