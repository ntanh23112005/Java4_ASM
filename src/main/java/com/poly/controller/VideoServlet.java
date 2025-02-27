package com.poly.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.UserDAOImpl;
import com.poly.dao.VideoDAOImpl;
import com.poly.entity.User;
import com.poly.entity.Video;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/listVideo")
@MultipartConfig(fileSizeThreshold = 1024*1024, maxFileSize = 1024*1024*5, maxRequestSize = 1024*1024*10)
public class VideoServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		VideoDAOImpl vdao = new VideoDAOImpl();
		List<Video> list = vdao.findAll();
		req.setAttribute("videos", list);
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		
		if("update".equals(action)) {
			try {
				doUpdateVideo(req,resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if("delete".equals(action)) {
			VideoDAOImpl dao = new VideoDAOImpl();
			String id = req.getParameter("id");
			dao.delete(id);
			resp.sendRedirect("listVideo");
		}else if("create".equals(action)) {
			doCreateVideo(req,resp);
		}
	}

	private void doCreateVideo(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		VideoDAOImpl dao = new VideoDAOImpl();
		try {
			Video video = new Video();
			BeanUtils.populate(video, req.getParameterMap());
			
			//xử lý hình ảnh
			String absolutePath = getServletContext().getRealPath("/img");
			
			Part filePart = req.getPart("poster");
			String fileName = null;
			if(filePart != null && filePart.getSize() > 0) {
				fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
				String filePath = absolutePath + File.separator + fileName;
				
				//lưu vào thư mục
				File upload = new File(absolutePath);
				if(!upload.exists()) {
					upload.mkdir();
				}
				filePart.write(filePath);
				
				video.setPoster(fileName);
				
			}
			dao.create(video);
			resp.sendRedirect("listVideo");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private void doUpdateVideo(HttpServletRequest req, HttpServletResponse resp) throws IllegalAccessException, InvocationTargetException {
		VideoDAOImpl dao = new VideoDAOImpl();
		try {
			Video video = new Video();
			BeanUtils.populate(video, req.getParameterMap());
			
			//xử lý hình ảnh
			String absolutePath = getServletContext().getRealPath("/img");
			
			Part filePart = req.getPart("poster");
			String fileName = null;
			if(filePart != null && filePart.getSize() > 0) {
				fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
				String filePath = absolutePath + File.separator + fileName;
				
				//lưu vào thư mục
				File upload = new File(absolutePath);
				if(!upload.exists()) {
					upload.mkdir();
				}
				filePart.write(filePath);
				
				video.setPoster(fileName);
				
			}
			
			dao.update(video);
			
			resp.sendRedirect("listVideo");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
