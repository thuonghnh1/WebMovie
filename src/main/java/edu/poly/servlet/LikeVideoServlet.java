package edu.poly.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.dao.FarvoriteDao;
import edu.poly.entity.Favorite;
import edu.poly.entity.User;
import edu.poly.entity.Video;

@WebServlet("/LikeVideo")
public class LikeVideoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = (String) request.getSession().getAttribute("taiKhoan");
		if (username == null) {
			response.sendRedirect("Login");
			return;
		}
		String page = request.getParameter("page");
		String videoId = request.getParameter("videoId");

		if (videoId == null) {
			response.sendRedirect("/Assignment_JAVA/index");
			return;
		}
		try {
			FarvoriteDao dao = new FarvoriteDao();
			Favorite favorite = new Favorite();
			Video video = new Video();

			video.setVideoId(videoId);
			favorite.setVideo(video);

			User user = new User();
			user.setUsername(username);
			favorite.setUser(user);
			favorite.setLikedDate(new Date());

			dao.create(favorite);

			request.setAttribute("message", "Video is added to Favorite");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", e.getMessage());
		}
		if (page == null) {
			page = "/Assignment_JAVA/index";
		}
		request.getRequestDispatcher(page).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}