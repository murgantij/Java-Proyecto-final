package com.divididos.daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.divididos.connection.AdministradorDeConexiones;
import com.divididos.dto.Estadio;
import com.divididos.dto.Provincia;
import com.divididos.dto.Recital;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class RecitalDAO {

        private static final String SQL_DELETE = "DELETE FROM RECITALES WHERE ID = ?";
	/*metodos del crud*/
	public Recital obtenerPorId(Long id) {
		String sql = "SELECT * FROM RECITALES RE \n" +
"INNER JOIN ESTADIOS ES ON ES.ID = RE.ESTADIO\n" +
"INNER JOIN provincias PR ON PR.id = ES.provincia\n" +
"WHERE RE.Id="+id;
		
		//Connection
		Connection con = AdministradorDeConexiones.getConnection();
	
		Recital recitalFromDb = null;
		
		//Statement
		try {
			Statement st = con.createStatement();
			
			//resultset
			ResultSet rs = st.executeQuery(sql);
			
			//VIENE UN SOLO REGISTRO!!!
			
			if(rs.next()) {//si existe, hay uno solo
				// rs > sacando los datos
			        
                                Provincia provincia = new Provincia(rs.getLong(9),rs.getString(11));
                                
                                Estadio estadio = new Estadio(rs.getLong(2),rs.getString(6),rs.getString(7),rs.getLong(8),provincia);
                        
                                Long idRecital=rs.getLong(1);
                                String fecha=rs.getString(3);
                                Float precio=rs.getFloat(4);
                                //campos crear un objeto????
				recitalFromDb = new Recital(idRecital,fecha,precio,estadio);
			}			
		} catch (SQLException e) {
			// ERRORES
			e.printStackTrace();
		}
		return recitalFromDb;
	}
	

	/*metodos del crud*/
	public List<Recital> listarRecitales() {
		String sql = "SELECT * FROM RECITALES RE \n" +
"INNER JOIN ESTADIOS ES ON ES.ID = RE.ESTADIO\n" +
"INNER JOIN provincias PR ON PR.id = ES.provincia";
		
		//Connection
		Connection con = AdministradorDeConexiones.getConnection();
	
		List<Recital> list = new ArrayList<>();
		
		//Statement
		try {
			Statement st = con.createStatement();
			
			//resultset
			ResultSet rs = st.executeQuery(sql);
			
			//VIENE UN SOLO REGISTRO!!!
			

                        while(rs.next()) {//
				// rs > sacando los datos
                                Provincia provincia = new Provincia(rs.getLong(9),rs.getString(11));
                                
                                Estadio estadio = new Estadio(rs.getLong(2),rs.getString(6),rs.getString(7),rs.getLong(8),provincia);
                                                        
                                Long idRecital=rs.getLong(1);
                                String fecha=rs.getString(3);
                                Float precio=rs.getFloat(4);
                                //campos crear un objeto????
                                
                                Recital recitalFromDb = new Recital(idRecital,fecha,precio,estadio);
				
				//agrego a la lista 
				list.add(recitalFromDb);
			}			
			
			//cierro la conexion
			con.close();
		} catch (SQLException e) {
			// ERRORES
			e.printStackTrace();
		}
		return list;
	}

	
                                
        public void crearRecital(Long IdEstadio, String precio, String fecha) {
		
		Connection con = AdministradorDeConexiones.getConnection();
		
		if(con != null) { 
			// insert en la db > SQL: INSERT INTO....
			String sql = "INSERT INTO RECITALES (estadio, precio,fecha) ";
			sql += "VALUES('"+IdEstadio+"',"+precio+",'"+fecha+"')";
			
			//control de errores
			try {
				Statement st = con.createStatement();			
				st.execute(sql);
				
				//cierre de conexion
				con.close();
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void actualizarRecital(Long idRecital, Long IdEstadio, String precio, String fecha) {
		Connection con = AdministradorDeConexiones.getConnection();
		
                if(con != null) { 
			String sql = "UPDATE RECITALES "
					+ " set Estadio='"+IdEstadio+"',"
					+ " precio='"+precio+"',"
					+ " fecha='"+ fecha +"'"
					+ " WHERE id = '"+idRecital+"'";		
		
			try {
				Statement st = con.createStatement();			
				st.executeUpdate(sql);
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
        public int eliminarRecital(Long id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        int registros = 0;
        
        try{
            conn = AdministradorDeConexiones.getConnection();
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setLong(1, id);
            registros = stmt.executeUpdate();
        } catch(SQLException | NullPointerException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                stmt.close();
                conn.close();
            } catch(SQLException | NullPointerException ex) {
                ex.printStackTrace(System.out);
            }
        }
        
        return registros;
    }
}
