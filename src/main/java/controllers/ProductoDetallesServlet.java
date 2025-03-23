package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import models.ProductoDetalle;
import services.ProductoDetalleService;
import services.impl.ProductoDetalleServiceImpl;

@WebServlet("/productodetalles")
public class ProductoDetallesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ProductoDetalleService productoDetalleService;
    
    public ProductoDetallesServlet() {
        super();
        productoDetalleService = new ProductoDetalleServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer idProducto = Integer.parseInt(request.getParameter("idProducto"));
        
        // Obtener los detalles del producto
        List<ProductoDetalle> productodetalles = productoDetalleService.listarDetallePorIdProducto(idProducto);
        
        // Obtener las imágenes del producto
        List<String> imagenes = productoDetalleService.listarImagenesPorIdProducto(idProducto);
        
        // Pasar los detalles y las imágenes al JSP
        request.setAttribute("productodetalles", productodetalles);
        request.setAttribute("imagenes", imagenes); // Pasar las imágenes
        
        // Redirigir al JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/productosdetalles.jsp");
        dispatcher.forward(request, response);
    }
}
