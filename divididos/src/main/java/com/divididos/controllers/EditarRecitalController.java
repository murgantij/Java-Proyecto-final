package com.divididos.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.divididos.daos.RecitalDAO;
import com.divididos.dto.Recital;


import com.divididos.daos.EstadioDAO;
import com.divididos.dto.Estadio;
import java.util.List;

@WebServlet("/api/EditarRecitalController")
public class EditarRecitalController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		
		//Crear RecitalDAO
		RecitalDAO dao = new RecitalDAO();
		
		//invocar el metodo obtenerPorId(id)
		Recital recital = dao.obtenerPorId(Long.parseLong(id));
		
		req.setAttribute("recital", recital);
                
                EstadioDAO estadioDao = new EstadioDAO();
		
		//invocar el metodo obtenerPorId(id)
		List<Estadio> estadios = estadioDao.listarEstadios();
                
		req.setAttribute("estadios", estadios);
		
		//ir a la siguiente pagina
		getServletContext().getRequestDispatcher("/editar_recital.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Long idRecital = Long.parseLong(req.getParameter("idRecital"));
		Long idLugar = Long.parseLong(req.getParameter("estadio"));
		String precio = req.getParameter("precio");
		String fecha = req.getParameter("fecha");
		
		//Crear RecitalDAO
		RecitalDAO dao = new RecitalDAO();
		
		//invocar actualizarRecital(params)
		dao.actualizarRecital(idRecital, idLugar, precio, fecha);

		//ir a la siguiente pagina
		resp.sendRedirect(req.getContextPath()+"/api/RecitalesController");
	}
}

