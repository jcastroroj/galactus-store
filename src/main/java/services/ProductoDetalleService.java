package services;

import java.util.List;
import models.ProductoDetalle;

public interface ProductoDetalleService {
	List<ProductoDetalle> listarDetallePorIdProducto(Integer idProducto);  
	List<String> listarImagenesPorIdProducto(Integer idProducto);
}