package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Categoria;
import services.CategoriaService;
import services.impl.CategoriaServiceImpl;

/**
 * Servlet implementation class CategoriaServlet
 */
@WebServlet("/categorias")
public class CategoriaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private final CategoriaService categoriaService;

    public CategoriaServlet() {
        super();
        categoriaService = new CategoriaServiceImpl(); //
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Categoria> categorias = categoriaService.listarCategorias();
		request.setAttribute("categorias", categorias);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/views/categorias.jsp");
		dispatcher.forward(request, response);
	}


}
