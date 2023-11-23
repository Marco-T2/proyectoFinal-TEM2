package com.emergentes.dao;

import com.emergentes.modelo.Detalle_venta;
import com.emergentes.utiles.ConexionBD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Detalle_ventaDAOimpl extends ConexionBD implements Detalle_ventaDAO {

    @Override
    public void insert(Detalle_venta detalle_venta) throws Exception {
        try {
            this.conectar();
            PreparedStatement dv = this.conn.prepareStatement("INSERT INTO detalle_venta (idventa,idarticulo,cantidad,precio_venta,descuento) values (?,?,?,?,?)");
            dv.setInt(1, detalle_venta.getIdventa());
            dv.setInt(2, detalle_venta.getIdarticulo());
            dv.setInt(3, detalle_venta.getCantidad());
            dv.setDouble(4, detalle_venta.getPrecio_venta());
            dv.setDouble(5, detalle_venta.getDescuento());
            dv.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Detalle_venta detalle_venta) throws Exception {

    }

    @Override
    public void delete(int id) throws Exception {

    }

    @Override
    public Detalle_venta getById(int id) throws Exception {
        //Creamos un objeto y la instanciamos como nuevo objeto
        Detalle_venta dventa = new Detalle_venta();
        try {
            this.conectar();
            String sql = "select dv.*,a.nombre as articulo,(dv.cantidad*dv.precio_venta-dv.descuento) as subtotal from detalle_venta dv LEFT join articulo a on dv.idarticulo=a.idarticulo where dv.idventa=?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                dventa.setIddetalle_venta(rs.getInt("iddetalle_venta"));
                dventa.setIdventa(rs.getInt("idventa"));
                dventa.setIdarticulo(rs.getInt("idarticulo"));
                dventa.setCantidad(rs.getInt("cantidad"));
                dventa.setPrecio_venta(rs.getDouble("precio_venta"));
                dventa.setDescuento(rs.getDouble("descuento"));
                dventa.setArticulo(rs.getString("articulo"));
                dventa.setSubtotal(rs.getDouble("subtotal"));
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return dventa;
    }

    @Override
    public List<Detalle_venta> getAllId(int id) throws Exception {
        List<Detalle_venta> lista = null;
        try {
            this.conectar();
            String sql = "select dv.*,a.nombre as articulo,(dv.cantidad*dv.precio_venta-dv.descuento) as subtotal from detalle_venta dv LEFT join articulo a on dv.idarticulo=a.idarticulo where dv.idventa=?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Detalle_venta>();
            while (rs.next()) {
                Detalle_venta d_ven = new Detalle_venta();
                d_ven.setIddetalle_venta(rs.getInt("iddetalle_venta"));
                d_ven.setIdventa(rs.getInt("idventa"));
                d_ven.setIdarticulo(rs.getInt("idarticulo"));
                d_ven.setCantidad(rs.getInt("cantidad"));
                d_ven.setPrecio_venta(rs.getDouble("precio_venta"));
                d_ven.setDescuento(rs.getDouble("descuento"));
                d_ven.setArticulo(rs.getString("articulo"));
                d_ven.setSubtotal(rs.getDouble("subtotal"));
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }

    @Override
    public List<Detalle_venta> getAll() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
