package com.divididos.controllers;

import java.io.IOException;

import com.divididos.daos.EstadioDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/EliminarEstadioController")
public class EliminarEstadioController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		Long id = Long.parseLong(req.getParameter("id"));
                
                EstadioDAO dao = new EstadioDAO();
                
                dao.eliminarEstadio(id);
                resp.sendRedirect(req.getContextPath()+"/api/EstadiosController");

	}
}
