package edu.poly.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.entity.Video;

@WebServlet({ "/page/item/*", "/page/item/next/*", "/page/item/back/*", "/page/item/index" })
public class PageItemServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("utf-8");
//		String uri = request.getRequestURI();
//
//		Video video = null;

		request.getRequestDispatcher("/admin/videos/video.jsp").forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		if (uri.contains("watch")) {
			doWatch(request, response);
		}

		request.getRequestDispatcher("/admin/videos/video.jsp").forward(request, response);
	}

	protected void doWatch(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String uri = request.getRequestURI();
//	    String id = uri.substring(uri.lastIndexOf("/") + 1);
	    String id = request.getParameter("videoId");
	    response.sendRedirect(request.getContextPath() + "/detailMovie?videoId=" + id);
	}
}
