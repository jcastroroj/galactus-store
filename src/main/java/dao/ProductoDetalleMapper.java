package dao;

import java.util.List;


import models.ProductoDetalle;

public interface ProductoDetalleMapper {
	List<ProductoDetalle> listarDetallePorIdProducto(Integer idProducto); 
	List<String> listarImagenesPorIdProducto(Integer idProducto);
}