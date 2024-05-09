package edu.poly.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.dao.FarvoriteDao;
import edu.poly.dao.ShareDao;
import edu.poly.dao.VideoDao;
import edu.poly.entity.FavoriteReport;
import edu.poly.entity.FavoriteUserReport;
import edu.poly.entity.ShareReport;
import edu.poly.entity.Video;

@WebServlet("/ReportsManagementServlet")
public class ReportsManagementServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		reportFavoritesByVideos(request, response);
		reportFavoriteUsersByVideo(request, response);
		reportShareUsersByVideo(request, response);
		request.getRequestDispatcher("/admin/reports/thongke.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
// vid yêu thích
	protected void reportFavoriteUsersByVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String videoUserId = request.getParameter("videoUserId");
			VideoDao vdao = new VideoDao();
			List<Video> vlist = vdao.findAll();

			if (videoUserId == null && vlist.size() > 0) {
				videoUserId = vlist.get(0).getVideoId();
			}

			FarvoriteDao dao = new FarvoriteDao();
			List<FavoriteUserReport> list = dao.reportFavoriteUsersByVideo(videoUserId);

			request.setAttribute("videoUserId", videoUserId);
			request.setAttribute("vidList", vlist);
			request.setAttribute("favUsers", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}

	}
// user yêu thích vid
	protected void reportFavoritesByVideos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			FarvoriteDao dao = new FarvoriteDao();
			List<FavoriteReport> list = dao.reportFavoritesByVideo();

			request.setAttribute("favList", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}
// share vid
	protected void reportShareUsersByVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String videoShareId = request.getParameter("videoShareId");
			VideoDao vdao = new VideoDao();
			List<Video> vlist = vdao.findAll();
			if (videoShareId == null && vlist.size() > 0) {
				videoShareId = vlist.get(0).getVideoId();
			}
			ShareDao dao = new ShareDao();
			List<ShareReport> list = dao.reportShareByVideo(videoShareId);
			request.setAttribute("videoShareId", videoShareId);
			request.setAttribute("vidList", vlist);
			request.setAttribute("shareUsers", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

}