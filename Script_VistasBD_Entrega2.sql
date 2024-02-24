CREATE VIEW VistaProductosPorCategoria AS
SELECT p.Nombre AS NombreProducto, p.Descripcion, p.Precio, p.CantidadStock, p.Marca, c.Nombre AS Categoria
FROM Producto p
JOIN Categoria c ON p.CategoriaID = c.CategoriaID;

CREATE VIEW VistaPedidosPorCliente AS
SELECT cl.Nombre AS NombreCliente, cl.Apellido, cl.CorreoElectronico, p.PedidoID, p.FechaPedido, p.EstadoPedido
FROM Pedido p
INNER JOIN Cliente cl ON p.ClienteID = cl.ClienteID;

CREATE VIEW VistaDetallePedidos AS
SELECT p.PedidoID, cl.Nombre AS NombreCliente, cl.Apellido, pr.Nombre AS Producto, dp.Cantidad, dp.PrecioUnitario
FROM DetallePedido dp
INNER JOIN Pedido p ON dp.PedidoID = p.PedidoID
INNER JOIN Cliente cl ON p.ClienteID = cl.ClienteID
INNER JOIN Producto pr ON dp.ProductoID = pr.ProductoID;

CREATE VIEW VistaOpinionesProducto AS
SELECT pr.Nombre AS Producto, o.Comentario, o.Puntuacion, cl.Nombre AS NombreCliente, cl.Apellido
FROM Opinion o
INNER JOIN Producto pr ON o.ProductoID = pr.ProductoID
INNER JOIN Cliente cl ON o.ClienteID = cl.ClienteID;

CREATE VIEW VistaInventarioPorTalla AS
SELECT pr.Nombre AS Producto, t.Nombre AS Talla, pt.CantidadStock
FROM ProductoTalla pt
INNER JOIN Producto pr ON pt.ProductoID = pr.ProductoID
INNER JOIN Talla t ON pt.TallaID = t.TallaID;

CREATE VIEW VistaVentasTotalesPorProducto AS
SELECT pr.Nombre AS Producto, SUM(dp.Cantidad) AS UnidadesVendidas, SUM(dp.PrecioUnitario * dp.Cantidad) AS IngresosTotales
FROM DetallePedido dp
INNER JOIN Producto pr ON dp.ProductoID = pr.ProductoID
GROUP BY pr.Nombre;
 