package edu.poly.servlet;

import java.io.IOException;
import java.util.Date;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import edu.poly.dao.EmailDao;
import edu.poly.dao.ShareDao;
import edu.poly.dao.VideoDao;
import edu.poly.entity.Share;
import edu.poly.entity.User;
import edu.poly.entity.Video;

@WebServlet("/ShareVideo")
public class ShareVideoServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  String username = (String) request.getSession().getAttribute("taiKhoan");
//		String username = (String) request.getSession().getAttribute("username");
		    if (username == null) {
		        response.sendRedirect("Login");
		        return;
		    }
		String videoId = request.getParameter("videoId");

		if (videoId == null) {
			response.sendRedirect("/Assignment_JAVA/index");
			return;
		}

		request.setAttribute("videoId", videoId);
		request.getRequestDispatcher("/admin/common/formshare.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fromEmail = "uchihahuynh01@gmail.com";
		String password = "gaozrkofptejprfc";

		String emailAddress = request.getParameter("email");
		String videoId = request.getParameter("videoId");

		VideoDao videoDao = new VideoDao();
        Video video = videoDao.findById(videoId);
        
		if (videoId == null) {
			request.setAttribute("error", "VideoId is null !");
		} else {
			String emailSubject = "Share Favorite Video";
			StringBuilder emailContent = new StringBuilder();
			emailContent.append("Dear Ms/Mr. <br>");
			emailContent.append("The Video is more interesting and I want to share whith you. <br>");
			emailContent.append("Please click the link ")
		    .append(String.format("<a href='https://www.youtube.com/embed/%s'>View Video</a><br>", video.getTrailer()));

			emailContent.append("Regards <br>");
			emailContent.append("Administrator");

			ShareDao dao = new ShareDao();
			Share share = new Share();
			share.setEmails(emailAddress);
			share.setSharedDate(new Date());

//	        String username = (String) request.getSession().getAttribute("username");
			String username = (String) request.getSession().getAttribute("taiKhoan");

			User user = new User();
			user.setUsername(username);

			share.setUser(user);
//			Video video = new Video();
			video.setVideoId(videoId);
			share.setVideo(video);

			dao.insert(share);

			try {
				EmailDao.sendEmail(fromEmail, password, emailAddress, emailSubject, emailContent.toString());
				request.setAttribute("message",
						"You sent a movie trailer to your friend.");
			} catch (MessagingException e) {
				e.printStackTrace();
				request.setAttribute("error", "Có lỗi xảy ra trong khi gửi email: " + e.getMessage());
			}
			request.getRequestDispatcher("/admin/common/formshare.jsp").forward(request, response);

		}
	}
}