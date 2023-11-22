package com.emergentes.dao;
import com.emergentes.modelo.Venta;
import com.emergentes.utiles.ConexionBD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VentaDAOimpl extends ConexionBD implements VentaDAO {

    @Override
    public void insert(Venta venta) throws Exception {
    
    }

    @Override
    public void update(Venta venta) throws Exception {
    
    }

    @Override
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM venta WHERE idventa=?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Venta getById(int id) throws Exception {
        Venta ven = new Venta();
        try {
            this.conectar();
            String sql = "select v.*,p.nombre as cliente,u.nombre as usuario from venta v LEFT JOIN persona p ON v.idcliente=p.idpersona LEFT JOIN usuario u ON v.idusuario=u.idusuario where idusuario=?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ven.setIdventa(rs.getInt("idventa"));
                ven.setIdcliente(rs.getInt("idcliente"));
                ven.setIdusuario(rs.getInt("idusuario"));
                ven.setTipo_comprobante(rs.getString("tipo_comprobante"));
                ven.setSerie_comprobante(rs.getString("serie_comprobante"));
                ven.setNum_comprobante(rs.getString("num_comprobante"));
                ven.setFecha_hora(rs.getDate("fecha_hora"));
                ven.setTotal_venta(rs.getDouble("total_venta"));
                ven.setEstado(rs.getString("estado"));
                ven.setCliente(rs.getString("cliente"));
                ven.setUsuario(rs.getString("usuario"));
                
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return ven;
    }

    @Override
    public List<Venta> getAll() throws Exception {
    //Creamos una coleccion de clientes y la instanciamos como nuevo objeto
        List<Venta> lista = null;
        try {
            //Como es una extencion de conectar se paso todos los metodos para utilizar
            this.conectar();
            String sql = "select v.*,p.nombre as cliente,u.nombre as usuario from venta v LEFT JOIN persona p ON v.idcliente=p.idpersona LEFT JOIN usuario u ON v.idusuario=u.idusuario where p.tipo_persona='Cliente'";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            //Se tiene el resultado en rs    
            ResultSet rs = ps.executeQuery();
            //Iniciamos la lista
            lista = new ArrayList<Venta>();
            //Cambiamos el if por while al ser mas de un registro
            while (rs.next()) {
                //Instanciasmo un nuevo objeto
                Venta ven = new Venta();
                ven.setIdventa(rs.getInt("idventa"));
                ven.setIdcliente(rs.getInt("idcliente"));
                ven.setIdusuario(rs.getInt("idusuario"));
                ven.setTipo_comprobante(rs.getString("tipo_comprobante"));
                ven.setSerie_comprobante(rs.getString("serie_comprobante"));
                ven.setNum_comprobante(rs.getString("num_comprobante"));
                ven.setFecha_hora(rs.getDate("fecha_hora"));
                ven.setTotal_venta(rs.getDouble("total_venta"));
                ven.setEstado(rs.getString("estado"));
                ven.setCliente(rs.getString("cliente"));
                ven.setUsuario(rs.getString("usuario"));
                lista.add(ven);
            }
            rs.close();
            ps.close();
            //Recomendable usar un try cath
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
}
