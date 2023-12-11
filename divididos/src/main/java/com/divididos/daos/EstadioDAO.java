package com.divididos.daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.divididos.connection.AdministradorDeConexiones;
import com.divididos.dto.Estadio;
import com.divididos.dto.Provincia;
import java.sql.PreparedStatement;

public class EstadioDAO {

        private static final String SQL_DELETE = "DELETE FROM ESTADIOS WHERE ID = ?";
	/*metodos del crud*/
	public Estadio obtenerPorId(Long id) {
		String sql = "SELECT * FROM ESTADIOS LU \n" +
"INNER JOIN PROVINCIAS PR ON PR.ID = LU.PROVINCIA\n" +
"WHERE LU.ID="+id;
		
		//Connection
		Connection con = AdministradorDeConexiones.getConnection();
	
		Estadio estadioFromDb = null;
		
		//Statement
		try {
			Statement st = con.createStatement();
			
			//resultset
			ResultSet rs = st.executeQuery(sql);
			
			//VIENE UN SOLO REGISTRO!!!
			
			
                        if(rs.next()) {//si existe, hay uno solo
				// rs > sacando los datos
				
                                Provincia provincia = new Provincia(rs.getLong(5),rs.getString(7));
                                        
                                Long idEstadio = rs.getLong(1);//tomar la primer columna
				String nombre = rs.getString(2);
				String calle = rs.getString(3);
				Long numero = rs.getLong(4);
				
				//campos crear un objeto????
				estadioFromDb = new Estadio(idEstadio,nombre,calle,numero,provincia);
			}			
		} catch (SQLException e) {
			// ERRORES
			e.printStackTrace();
		}
		return estadioFromDb;
	}
	

	/*metodos del crud*/
	public List<Estadio> listarEstadios() {
		String sql = "SELECT * FROM ESTADIOS LU \n" +
"INNER JOIN PROVINCIAS PR ON PR.ID = LU.PROVINCIA";
		
		//Connection
		Connection con = AdministradorDeConexiones.getConnection();
	
		List<Estadio> list = new ArrayList<>();
		
		//Statement
		try {
			Statement st = con.createStatement();
			
			//resultset
			ResultSet rs = st.executeQuery(sql);
			
			//VIENE UN SOLO REGISTRO!!!
			
			while(rs.next()) {//
				// rs > sacando los datos
				
                                Provincia provincia = new Provincia(rs.getLong(5),rs.getString(7));
                                        
                                Long idEstadio = rs.getLong(1);//tomar la primer columna
				String nombre = rs.getString(2);
				String calle = rs.getString(3);
				Long numero = rs.getLong(4);
				
				//campos crear un objeto????
				Estadio estadioFromDb = new Estadio(idEstadio,nombre,calle,numero,provincia);
				
				//agrego a la lista 
				list.add(estadioFromDb);
			}			
			
			//cierro la conexion
			con.close();
		} catch (SQLException e) {
			// ERRORES
			e.printStackTrace();
		}
		return list;
	}

	public void crearEstadio(String nombre, String calle, String numero, Long idProvincia){
		
		Connection con = AdministradorDeConexiones.getConnection();
		
		if(con != null) { 
			// insert en la db > SQL: INSERT INTO....
			String sql = "INSERT INTO ESTADIOS (nombre, calle,numero,provincia) ";
			sql += "VALUES('"+nombre+"','" +calle+"','"+numero+"','"+idProvincia+"')";
			
                        
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

	public void actualizarEstadio(Long idEstadio, String nombre, String calle, String numero, Long idProvincia) {
		Connection con = AdministradorDeConexiones.getConnection();
		if(con != null) { 
			String sql = "UPDATE ESTADIOS "
					+ " set nombre='"+nombre+"',"
					+ " calle='"+calle+"',"
					+ " numero='"+ numero +"',"
                                        + " provincia='"+ idProvincia +"'"
					+ " WHERE id = '"+idEstadio+"'";		
		
			try {
				Statement st = con.createStatement();			
				st.executeUpdate(sql);
				con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/*metodos del crud*/
	public List<Estadio> buscar(String clave) {
		String sql = "SELECT * FROM ESTADIOS WHERE nombre LIKE '%"+clave+"%' ";
		
		//Connection
		Connection con = AdministradorDeConexiones.getConnection();
	
		List<Estadio> listado = new ArrayList<Estadio>();
		
		//Statement
		try {
			Statement st = con.createStatement();
			
			//resultset
			ResultSet rs = st.executeQuery(sql);
			
			//VIENE UN SOLO REGISTRO!!!
			
			  
                        while(rs.next()) {//si existe, hay uno solo
				// rs > sacando los datos
				Provincia provincia = new Provincia(rs.getLong(5),rs.getString(7));
                                         
                                Long idEstadio = rs.getLong(1);//tomar la primer columna
				String nombre = rs.getString(2);
				String calle = rs.getString(3);
				Long numero = rs.getLong(4);
				
				
				//campos crear un objeto????
				Estadio estadioFromDb = new Estadio(idEstadio,nombre,calle,numero,provincia);
				
				listado.add(estadioFromDb);
			}	
		} catch (SQLException e) {
			// ERRORES
			e.printStackTrace();
		}
		
		return listado;
	}
        
        public int eliminarEstadio(Long id) {
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
