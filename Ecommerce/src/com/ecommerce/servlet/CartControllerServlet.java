package com.ecommerce.servlet;



import com.ecommerce.bean.Cart;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns = { "/cart" })
public class CartControllerServlet extends HttpServlet {

//public static final String addToCart

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	String strAction = request.getParameter("action");

	if(strAction!=null && !strAction.equals("")) {
		if(strAction.equals("add")) {
			addToCart(request);
		} else if (strAction.equals("Update")) {
			updateCart(request);
		} else if (strAction.equals("Delete")) {
			deleteCart(request);
			}
		}
	RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/ShoppingCart.jsp");

	dispatcher.forward(request, response);

	//response.sendRedirect("../cart");
 }

	protected void deleteCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String strItemIndex = request.getParameter("itemIndex");
		Cart cart = null;

		Object objCart = session.getAttribute("cart");
		if(objCart!=null) {
			cart = (Cart) objCart ;
		} else {
			cart = new Cart();
		}
		cart.deleteCartItem(strItemIndex);
	}

	protected void updateCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String strQuantity = request.getParameter("quantity");
		String strItemIndex = request.getParameter("itemIndex");

		Cart cart = null;

		Object objCart = session.getAttribute("cart");
		if(objCart!=null) {
			cart = (Cart) objCart ;
		} else {
			cart = new Cart();
		}
		cart.updateCartItem(strItemIndex, strQuantity);
	}

	protected void addToCart(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String strModelNo = request.getParameter("modelNo");
		String strDescription = request.getParameter("description");
		String strPrice = request.getParameter("price");
		String strQuantity = request.getParameter("quantity");

		Cart cart = null;

		Object objCart = session.getAttribute("cart");

		if(objCart!=null) {
			cart = (Cart) objCart ;
		} else {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		cart.addCartItem(strModelNo, strDescription, strPrice, strQuantity);
	}

}