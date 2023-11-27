package com.emergentes.dao;

import com.emergentes.modelo.IngresoAuditoria;
import java.sql.Connection;
import java.util.List;
import java.util.Vector;

public interface ingresoAuditoriaDAO {
    public int insert(IngresoAuditoria ingresoAuditoria)throws Exception;
    public void update(IngresoAuditoria venta)throws Exception;
    public void delete(int id)throws Exception;
    public IngresoAuditoria getById(int id)throws Exception;
    public List<IngresoAuditoria>getAll()throws Exception;
    public Vector<Double> getVentaMes()throws Exception;
    public Vector<String> getMes()throws Exception;
    
}
