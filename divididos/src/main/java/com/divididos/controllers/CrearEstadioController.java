package com.divididos.controllers;

import com.divididos.daos.EstadioDAO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.divididos.daos.RecitalDAO;

@WebServlet("/api/CrearEstadioController")
public class CrearEstadioController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		Long idProvincia = Long.parseLong(req.getParameter("provincia"));
		String nombre = req.getParameter("nombre");
                String calle = req.getParameter("calle");
		String numero = req.getParameter("numero");
		
		//Crear EstadioDAO
		EstadioDAO dao = new EstadioDAO();
		
		dao.crearEstadio(nombre, calle, numero, idProvincia);

		resp.sendRedirect(req.getContextPath()+"/api/EstadiosController");
	}
}
