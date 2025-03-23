package services.impl;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.MyBatisUtil;
import dao.ProductoDetalleMapper;
import models.ProductoDetalle;
import services.ProductoDetalleService;

public class ProductoDetalleServiceImpl implements ProductoDetalleService {

	@Override
	public List<ProductoDetalle> listarDetallePorIdProducto(Integer idProducto) {
		try {
			SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
			ProductoDetalleMapper productodetalleMapper = session.getMapper(ProductoDetalleMapper.class);
			return productodetalleMapper.listarDetallePorIdProducto(idProducto);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	 @Override
	    public List<String> listarImagenesPorIdProducto(Integer idProducto) {
	        try {
	            SqlSession session = MyBatisUtil.getSqlSessionFactory().openSession();
	            ProductoDetalleMapper productodetalleMapper = session.getMapper(ProductoDetalleMapper.class);
	            return productodetalleMapper.listarImagenesPorIdProducto(idProducto);
	        } catch (Exception e) {
	            System.out.println(e);
	            return null;
	        }
	    }
  
}
