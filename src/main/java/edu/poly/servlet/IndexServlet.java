package edu.poly.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.dao.VideoDao;
import edu.poly.entity.Video;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {

	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.setCharacterEncoding("UTF-8");
	        response.setCharacterEncoding("UTF-8");

	        VideoDao dao = new VideoDao();
	        List<Video> list = dao.findAll();
	        request.setAttribute("videoList", list);
	        request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
	    }

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String videoId = request.getParameter("videoId");

	        response.sendRedirect(request.getContextPath() + "/detailMovie?videoId=" + videoId);
	    }
}
