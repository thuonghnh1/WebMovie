package edu.poly.manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.dao.VideoDao;
import edu.poly.entity.Video;

@WebServlet({ "/admin", "/admin/video", "/admin/add", "/admin/update", "/admin/edit", "/admin/delete", "/admin/reset", "/admin/watch" })
public class EditMovie extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();

		Video video = null;
		System.out.println(uri);

		if (uri.contains("edit")) {
	        doEdit(request, response);

	    } else if (uri.contains("delete")) {
			doDeletePhim(request, response);
			video = new Video();
			request.setAttribute("video", video);
		}else if (uri.contains("reset")) {
			video = new Video();
			request.setAttribute("user", video);
		}
		try {
			findAll(request, response);
			request.getRequestDispatcher("/admin/videos/video.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		if (uri.contains("add")) {
			doAdd(request, response);
		}if (uri.contains("update")) {
			doUpdate(request, response);
		}
		if (uri.contains("watch")) {
			doWatch(request, response);
		}
		if (uri.contains("delete")) {
			doDeletePhim(request, response);
			request.setAttribute("video", new Video());
		}
		if (uri.contains("reset")) {
			request.setAttribute("video", new Video());
		}else if (uri.contains("edit")) {
	        doEdit(request, response);
	    } 

		try {
			findAll(request, response);
			response.isCommitted();
			request.getRequestDispatcher("/admin/videos/video.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doWatch(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String uri = request.getRequestURI();
	    String id = request.getParameter("videoId");
	    response.sendRedirect(request.getContextPath() + "/detailMovie?videoId=" + id);
	}

	
	protected void doEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String videoId = request.getParameter("videoId");
			
			VideoDao dao = new VideoDao();
			Video video = dao.findById(videoId);

			request.setAttribute("video", video);
			request.setAttribute("message", "User edited!!");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	protected void doAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Video video = new Video();
			System.out.println("video");
			BeanUtils.populate(video, request.getParameterMap());

			VideoDao dao = new VideoDao();
			dao.create(video);
			System.out.println("thêm thành công");

			request.setAttribute("message", "Video inserted successfully!");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}
	protected void doUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Video video = new Video();
			System.out.println("video");
			BeanUtils.populate(video, request.getParameterMap());

			VideoDao dao = new VideoDao();
			dao.update(video);
			System.out.println("update thành công");

			request.setAttribute("message", "Video updated successfully!");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}
	protected void doDeletePhim(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String id = request.getParameter("videoId");

			VideoDao dao = new VideoDao();
			dao.delete(id);
			request.setAttribute("message", "User deleted!!");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			VideoDao dao = new VideoDao();
			List<Video> list = dao.findAll();
			request.setAttribute("videos", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}
}
