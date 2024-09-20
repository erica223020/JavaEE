package com.systex.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.LinkedList;

import com.systex.model.Customer;

/**
 * Servlet implementation class CreateCustomer
 */
public class CreateCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		switch(action) {
		case "cc1":
			processCC1(request, response);
			break;
		case "cc2":
			processCC2(request, response);
			break;
		default:
			//Error Handling
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void processCC1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher view;
		LinkedList<String> errorMsgs = new LinkedList<>(); //放錯誤訊息
		request.setAttribute("errors", errorMsgs);//Reques-Scope
		
		//1. Retrieve From Data
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String telephone = request.getParameter("telephone");
		String address = request.getParameter("address");

		//2. Convert From Data
		//N/A
		//3. Validate From Data
		if(name == null || name.trim().isEmpty()) { //空白或去空白後還是空 
			errorMsgs.add("姓名欄位必須填寫"); 
		}
		if(email == null || email.trim().isEmpty()) { //空白或去空白後還是空 
			errorMsgs.add("電郵欄位必須填寫"); 
		}   
		if(telephone == null || telephone.trim().isEmpty()) { //空白或去空白後還是空 
			errorMsgs.add("電話欄位必須填寫"); 
		}   
		if(address == null || address.trim().isEmpty()) { //空白或去空白後還是空 
			errorMsgs.add("地址欄位必須填寫"); 
		}
		
		if(!errorMsgs.isEmpty()) {
			view = request.getRequestDispatcher("createCustomer1.jsp");
			view.forward(request, response);
			return; //把控制權還給Container
		}
		//4. Invoke Biz Logic
		try {
			Customer cust = new Customer();
			cust.setName(name);
			cust.setEmail(email);
			cust.setTelephone(telephone);
			cust.setAddress(address);
			
			HttpSession session = request.getSession();
			session.setAttribute("cust", cust);//Session-Scope

			view = request.getRequestDispatcher("createCustomer2.jsp");
			view.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
			errorMsgs.add(e.getMessage());
			view = request.getRequestDispatcher("createCustomer1.jsp");
			view.forward(request, response);
		}
		//5. Select Next View
	}

	protected void processCC2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
