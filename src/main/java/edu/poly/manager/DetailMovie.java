package edu.poly.manager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.dao.VideoDao;
import edu.poly.entity.Video;

@WebServlet({ "/detailMovie/*", "/detailMovie" })
public class DetailMovie extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String id = request.getParameter("videoId");

		request.getSession().setAttribute("videoId", id);

		Video entity = new Video();
		VideoDao dao = new VideoDao();
		entity = dao.findById(id);
		String review = "";
		try {
			review = entity.getDescription();
		} catch (Exception e) {
			review = entity.getDescription();
			e.printStackTrace();
		}
		request.setAttribute("description", review);
		request.setAttribute("video", entity);
		request.getRequestDispatcher("/admin/manager/DetailMovie.jsp").forward(request, response);
	}

}
