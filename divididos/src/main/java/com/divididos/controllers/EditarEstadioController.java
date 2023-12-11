package com.divididos.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.divididos.daos.EstadioDAO;
import com.divididos.dto.Estadio;


import com.divididos.daos.ProvinciaDAO;
import com.divididos.dto.Provincia;
import java.util.List;

@WebServlet("/api/EditarEstadioController")
public class EditarEstadioController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		
		//Crear EstadioDAO
		EstadioDAO dao = new EstadioDAO();
		
		//invocar el metodo obtenerPorId(id)
		Estadio estadio = dao.obtenerPorId(Long.parseLong(id));
		
		req.setAttribute("estadio", estadio);
                
                ProvinciaDAO provinciaDao = new ProvinciaDAO();
		
		//invocar el metodo obtenerPorId(id)
		List<Provincia> provincias = provinciaDao.listarProvincias();
                
		req.setAttribute("provincias", provincias);
		
		//ir a la siguiente pagina
		getServletContext().getRequestDispatcher("/editar_estadio.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Long idEstadio = Long.parseLong(req.getParameter("idEstadio"));
		Long idProvincia = Long.parseLong(req.getParameter("provincia"));
		String nombre = req.getParameter("nombre");
                String calle = req.getParameter("calle");
		String numero = req.getParameter("numero");
		
		//Crear EstadioDAO
		EstadioDAO dao = new EstadioDAO();
		
		//invocar actualizarEstadio(params)
		dao.actualizarEstadio(idEstadio, nombre, calle, numero, idProvincia);

		//ir a la siguiente pagina
		resp.sendRedirect(req.getContextPath()+"/api/EstadiosController");
	}
}

