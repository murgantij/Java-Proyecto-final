package com.divididos.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.divididos.daos.EstadioDAO;
import com.divididos.dto.Estadio;

@WebServlet("/api/EstadiosController")
public class EstadiosController extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//crear la instancia de EstadioDAO
		EstadioDAO dao = new EstadioDAO();
		
		//invocar al metodo listarEstadios()
		List<Estadio> estadio = dao.listarEstadios();
		
		//grabar el listado en el request para que lo vea la siguiente pagina
		req.setAttribute("estadio", estadio);
		
		//ir a la siguiente pagina
		getServletContext().getRequestDispatcher("/estadios.jsp").forward(req, resp);
	}
}

