package com.divididos.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.divididos.daos.RecitalDAO;

@WebServlet("/api/CrearRecitalController")
public class CrearRecitalController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Long idEstadio = Long.parseLong(req.getParameter("estadio"));
		String precio = req.getParameter("precio");
		String fecha = req.getParameter("fecha");
		
		RecitalDAO dao = new RecitalDAO();
		
		dao.crearRecital(idEstadio, precio, fecha);
		
		resp.sendRedirect(req.getContextPath()+"/api/RecitalesController");
	}
}
