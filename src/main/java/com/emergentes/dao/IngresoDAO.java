package com.emergentes.dao;

import com.emergentes.modelo.Ingreso;
import java.util.List;

public interface IngresoDAO {
    public int insert(Ingreso ingreso)throws Exception;
    public void update(Ingreso ingreso)throws Exception;
    public void delete(int id)throws Exception;
    public Ingreso getById(int id)throws Exception;
    public List<Ingreso>getAll()throws Exception;
}
