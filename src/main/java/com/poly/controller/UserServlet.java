package com.poly.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.UserDAOImpl;
import com.poly.dao.VideoDAOImpl;
import com.poly.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/listUser")
@MultipartConfig(fileSizeThreshold = 1024*1024, maxFileSize = 1024*1024*5, maxRequestSize = 1024*1024*10)
public class UserServlet extends HttpServlet {

	@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDAOImpl dao = new UserDAOImpl();
		List<User> list = dao.findAll();
		req.setAttribute("listUsers", list);
		req.getRequestDispatcher("user.jsp").forward(req, resp);
}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
String action = req.getParameter("action");
		
		if("update".equals(action)) {
			try {
				doUpdateUser(req,resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if("delete".equals(action)) {
			UserDAOImpl dao = new UserDAOImpl();
			String id = req.getParameter("id");
			dao.delete(id);
			resp.sendRedirect("listUser");
		}else if("create".equals(action)) {
			doCreateUser(req,resp);
		}
	}

	private void doCreateUser(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		UserDAOImpl dao = new UserDAOImpl();
		try {
			User user = new User();
			BeanUtils.populate(user, req.getParameterMap());
			
			//xử lý hình ảnh
			String absolutePath = getServletContext().getRealPath("/img");
			
			Part filePart = req.getPart("hinh");
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
				
				user.setHinh(fileName);
				
			}
			dao.create(user);
			resp.sendRedirect("listUser");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private void doUpdateUser(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		UserDAOImpl dao = new UserDAOImpl();
		try {
			User user = new User();
			BeanUtils.populate(user, req.getParameterMap());
			
			//xử lý hình ảnh
			String absolutePath = getServletContext().getRealPath("/img");
			
			Part filePart = req.getPart("hinh");
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
				
				user.setHinh(fileName);
				
			}
			dao.update(user);
			resp.sendRedirect("listUser");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
