package org.example.hacking02_sk.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.example.hacking02_sk.MyLibrary;



@WebServlet("/ImageReader")
public class ImageReader extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter printWriter = response.getWriter();
		HttpSession httpSession = request.getSession();
		
		String type = request.getParameter("type");

		String 절대경로파일 = "";
		
		if(MyLibrary.f_check_valid(type)) {
			if(MyLibrary.os_name.startsWith("window")) {
				절대경로파일 = request.getSession().getServletContext().getRealPath("/").toString().replaceAll("\\\\","/").replace("/webapp","/resources/static/" + type);
			}else if(MyLibrary.os_name.startsWith("linux")) {
				절대경로파일 = httpSession.getServletContext().getRealPath("/") + "WEB-INF/classes/static/" + type + "/";
			}
		}	
		
		String name1 = request.getParameter("name1");
		if(type.equals("images")) {
			if(MyLibrary.f_check_valid(name1)) {
				File file = new File(절대경로파일 + name1);
				if(file.exists()) {
					String imgBase64Str = MyLibrary.FileSystem.binStrToImgUrlBase64Str(MyLibrary.FileSystem.readAsBinFileToStr(file.getAbsolutePath()));

					response.getWriter().println(imgBase64Str);
				}else {
					response.getWriter().println("파일이 없거나 읽을 수 없음."); 
				}				
			}
		}
		
		String res_msg = "";
				

		
		if(type.equals("popup")) {
			// 파라미터 변조로 cmd 실행 정상동작 테스트 확인됨.
		    // param1.send_querystring = 'name1=popup.jpg&name2=popup2.jpg&name3=popup.txt' + encodeURIComponent('"&&notepad&REM "')+ '&type=popup'
			if(MyLibrary.f_check_valid(name1)) {
				File file = new File(절대경로파일 + name1);
				if(file.exists()) {
					res_msg+=MyLibrary.FileSystem.binStrToImgUrlBase64Str(MyLibrary.FileSystem.readAsBinFileToStr(file.getAbsolutePath()));
				}else {
					response.getWriter().println("파일이 없거나 읽을 수 없음."); 
				}
			}			
			
			String name2 = request.getParameter("name2");
			if(MyLibrary.f_check_valid(name2)) {
				File file = new File(절대경로파일 + name2);
				if(file.exists()) {
					res_msg+="---MY SPLIT---"+MyLibrary.FileSystem.binStrToImgUrlBase64Str(MyLibrary.FileSystem.readAsBinFileToStr(file.getAbsolutePath()));
				}else {
					response.getWriter().println("파일이 없거나 읽을 수 없음.");  
				}
			}			
			
			
			String name3 = request.getParameter("name3");
			if(MyLibrary.f_check_valid(name3)) {
				File file = new File(절대경로파일 + name3);
				//if(file.exists()) {
					res_msg+="---MY SPLIT---"+MyLibrary.f_cat(file.getAbsolutePath());
				//}else {
					//response.getWriter().println("파일이 없거나 읽을 수 없음."); 
				//}			  
			}
		}
		
		
		
		
		printWriter.println(res_msg);
		
		printWriter.flush();
		response.flushBuffer();   
	}

}
