<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="models.ProductoDetalle" %>
<%@ page import="shared.Constants" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>GALACTUS STORE | SISE</title>
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
    <style>
        .product-image {
            width: 100%;
            height: 400px;
            object-fit: contain;
        }

        .carousel-item {
            display: none;
        }
        .carousel-item.active {
            display: block;
        }

        .carousel-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: transparent;
            border: none;
            color: white;
            font-size: 2rem;
            padding: 10px;
            cursor: pointer;
            z-index: 10;
        }

        .carousel-button.left {
            left: 0;
        }

        .carousel-button.right {
            right: 0;
        }

        .carousel-button:hover {
            color: #4CAF50;
        }
    </style>
</head>
<body class="bg-gray-100 font-sans">

    <%
        List<ProductoDetalle> productodetalles = (List<ProductoDetalle>) request.getAttribute("productodetalles");
        List<String> imagenes = (List<String>) request.getAttribute("imagenes");
    %>

    <header class="bg-green-600">
        <div class="container mx-auto flex justify-center items-center space-x-4 py-4">
            <a href="/galactus-store" class="text-white hover:bg-green-700 p-3 rounded-md">Inicio</a>
            <a href="/galactus-store/categorias" class="text-white hover:bg-green-700 p-3 rounded-md border border-white">Categorías</a>
            <a href="#" class="text-white hover:bg-green-700 p-3 rounded-md">Marcas</a>
        </div>
    </header>

    <main class="container mx-auto p-6">
        <div class="flex justify-center">
            <div class="w-full sm:w-11/12 md:w-4/5 lg:w-3/4 xl:w-2/3 bg-white p-6 rounded-lg shadow-lg">
                <% if (productodetalles != null && !productodetalles.isEmpty()) { %>
                    <% for(ProductoDetalle productodetalle : productodetalles) { %>
                        <div class="flex flex-col-reverse md:flex-row items-center md:items-start justify-center gap-6">
                            <div class="w-full md:w-1/3">
                                <div id="carouselExample" class="relative">
                                    <div class="overflow-hidden relative h-[400px] w-full">
                                        <div class="carousel-inner relative w-full h-full">
                                            <% 
                                                if (imagenes != null && !imagenes.isEmpty()) { 
                                                    for (int i = 0; i < imagenes.size(); i++) {
                                            %>
                                            <div class="carousel-item <%= (i == 0) ? "active" : "" %> absolute inset-0 w-full h-full transition-transform duration-500">
                                                <img src="<%= imagenes.get(i) %>" alt="Imagen del producto" class="product-image block w-full h-full object-cover rounded-lg">
                                            </div>
                                            <% 
                                                    }
                                                }
                                            %>
                                        </div>
                                    </div>
                                    <button class="carousel-button left" id="prevBtn">❮</button>
                                    <button class="carousel-button right" id="nextBtn">❯</button>
                                </div>
                            </div>

                            <div class="w-full md:w-2/3 text-center md:text-left">
                                <h2 class="text-3xl font-semibold text-green-700 mb-4"><%= productodetalle.getNombre() %></h2>
                                <p class="text-gray-600 text-sm mb-2">Modelo: <%= productodetalle.getModelo() %></p>
                                <p class="text-gray-600 text-sm mb-2">Marca: <%= productodetalle.getMarca() %></p>
                                <p class="text-gray-600 text-sm mb-2">Subcategoría: <%= productodetalle.getSubcategoria() %></p>
                                <p class="text-gray-600 text-sm mb-2">Proveedor: <%= productodetalle.getProveedor() %></p>
                                <p class="text-gray-600 text-sm mb-2">Código Interno: <%= productodetalle.getCodigoInterno() %></p>
                                <p class="text-gray-600 text-sm mb-2">Código Externo: <%= productodetalle.getCodigoExterno() %></p>
                                <p class="text-gray-600 text-sm mb-2">Descripción: <%= productodetalle.getDescripcion() %></p>
                                <p class="text-gray-600 text-sm mb-2">Garantía: <%= productodetalle.getTiempoGarantiaMeses() %> meses</p>
                                <p class="text-gray-600 text-sm mb-4">Stock: <%= productodetalle.getStock() %> unidades</p>
                                <p class="text-blue-600 font-bold text-lg mb-4">S/. <%= productodetalle.getPrecio() %></p>
                            </div>
                        </div>
                    <% } %>
                <% } else { %>
                    <p class="w-full text-center text-gray-600">No se encontraron registros</p>
                <% } %>
            </div>
        </div>
    </main>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let currentIndex = 0;
            const items = document.querySelectorAll(".carousel-item");
            const totalItems = items.length;

            const prevButton = document.getElementById("prevBtn");
            const nextButton = document.getElementById("nextBtn");

            function showItem(index) {
                items.forEach((item, i) => {
                    item.classList.remove('active');
                    if (i === index) {
                        item.classList.add('active');
                    }
                });
            }

            nextButton.addEventListener("click", function() {
                currentIndex = (currentIndex + 1) % totalItems;
                showItem(currentIndex);
            });

            prevButton.addEventListener("click", function() {
                currentIndex = (currentIndex - 1 + totalItems) % totalItems;
                showItem(currentIndex);
            });

            showItem(currentIndex);
        });
    </script>

</body>
</html>
