package edu.poly.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.dao.FarvoriteDao;
import edu.poly.dao.UserDao;
import edu.poly.dao.VideoDao;
import edu.poly.entity.Video;

@WebServlet({ "/page/favorite/index", "/page/favorite/dislike/*" })
public class FavoriteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String username = (String) request.getSession().getAttribute("taiKhoan");
			if (username != null) {
				UserDao dao = new UserDao();
	            List<Video> userFavoriteVideos = dao.findUserByFavoriteVideo(username);

	            Set<Video> uniqueVideos = new HashSet<>(userFavoriteVideos);

	            List<Video> uniqueFavoriteVideos = new ArrayList<>(uniqueVideos);
				request.setAttribute("favoriteVideos", uniqueFavoriteVideos);
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
		request.getRequestDispatcher("/admin/common/favouritepage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		try {
			String uri = request.getRequestURI();
			UserDao dao = new UserDao();
			String user = (String) request.getSession().getAttribute("taiKhoan");
			List<Video> list = dao.findUserByFavoriteVideo(user);
			String username = (String) request.getSession().getAttribute("taiKhoan");
			if (uri.contains("dislike")) {
				doWatch(request, response);
				request.setAttribute("favoriteVideos", list);
				request.setAttribute("message", "Dislike thành công!!");

			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
//		request.getRequestDispatcher("/admin/common/favouritepage.jsp").forward(request, response);
	}

	protected void doWatch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String id = uri.substring(uri.lastIndexOf("/") + 1);
		String user = (String) request.getSession().getAttribute("taiKhoan");

		FarvoriteDao dao = new FarvoriteDao();
		dao.delete(dao.selectId(id, user));
		request.setAttribute("message", "Dislike thành công!!");
		response.sendRedirect(request.getContextPath() + "/page/favorite/index");
		
	}

}
