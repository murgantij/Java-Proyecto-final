package com.divididos.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.divididos.daos.RecitalDAO;
import com.divididos.dto.Recital;

@WebServlet("/api/RecitalesController")
public class RecitalesController extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//crear la instancia de RecitalDAO
		RecitalDAO dao = new RecitalDAO();
		
		//invocar al metodo listarRecitals()
		List<Recital> recital = dao.listarRecitales();
		
		//grabar el listado en el request para que lo vea la siguiente pagina
		req.setAttribute("recital", recital);
		
		//ir a la siguiente pagina
		getServletContext().getRequestDispatcher("/recitales.jsp").forward(req, resp);
	}
}

