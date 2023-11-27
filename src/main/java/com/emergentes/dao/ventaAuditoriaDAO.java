package com.emergentes.dao;

import com.emergentes.modelo.VentaAuditoria;
import java.util.List;
import java.util.Vector;

public interface ventaAuditoriaDAO {
    public int insert(VentaAuditoria ventaAuditoria)throws Exception;
    public void update(VentaAuditoria venta)throws Exception;
    public void delete(int id)throws Exception;
    public VentaAuditoria getById(int id)throws Exception;
    public List<VentaAuditoria>getAll()throws Exception;
    public Vector<Double> getVentaMes()throws Exception;
    public Vector<String> getMes()throws Exception;
}
