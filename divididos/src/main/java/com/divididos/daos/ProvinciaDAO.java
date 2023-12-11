package com.divididos.daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.divididos.connection.AdministradorDeConexiones;
import com.divididos.dto.Provincia;
import com.divididos.dto.Provincia;
import java.sql.PreparedStatement;

public class ProvinciaDAO {

       public List<Provincia> listarProvincias() {
		String sql = "SELECT * FROM PROVINCIAS";
		
		//Connection
		Connection con = AdministradorDeConexiones.getConnection();
	
		List<Provincia> list = new ArrayList<>();
		
		//Statement
		try {
			Statement st = con.createStatement();
			
			//resultset
			ResultSet rs = st.executeQuery(sql);
			
			//VIENE UN SOLO REGISTRO!!!
			
			while(rs.next()) {//
				// rs > sacando los datos
				
                                        
                                Long idProvincia = rs.getLong(1);//tomar la primer columna
				String nombre = rs.getString(2);
				
				//campos crear un objeto????
				Provincia provinciaFromDb = new Provincia(idProvincia,nombre);
				
				//agrego a la lista 
				list.add(provinciaFromDb);
			}			
			
			//cierro la conexion
			con.close();
		} catch (SQLException e) {
			// ERRORES
			e.printStackTrace();
		}
		return list;
	}

	
}
