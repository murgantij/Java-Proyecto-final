package com.divididos.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import com.divididos.connection.AdministradorDeConexiones;
import com.divididos.daos.RecitalDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/api/EliminarRecitalController")
public class EliminarRecitalController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		Long id = Long.parseLong(req.getParameter("id"));
                
                RecitalDAO dao = new RecitalDAO();
                
                dao.eliminarRecital(id);
                resp.sendRedirect(req.getContextPath()+"/api/RecitalesController");

	}
}
