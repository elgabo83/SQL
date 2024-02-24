CREATE PROCEDURE spAñadirNuevoProducto 
    @Nombre VARCHAR(50),
    @Descripcion TEXT,
    @Precio DECIMAL(10, 2),
    @CantidadStock INT,
    @Marca VARCHAR(50),
    @CategoriaID INT
AS
BEGIN
    INSERT INTO Producto (Nombre, Descripcion, Precio, CantidadStock, Marca, CategoriaID)
    VALUES (@Nombre, @Descripcion, @Precio, @CantidadStock, @Marca, @CategoriaID);
END;




CREATE PROCEDURE spActualizarStockProducto 
    @ProductoID INT,
    @CantidadStock INT
AS
BEGIN
    UPDATE Producto
    SET CantidadStock = @CantidadStock
    WHERE ProductoID = @ProductoID;
END;




CREATE PROCEDURE spRegistrarNuevoPedido 
    @ClienteID INT,
    @FechaPedido DATE,
    @EstadoPedido VARCHAR(50)
AS
BEGIN
    INSERT INTO Pedido (ClienteID, FechaPedido, EstadoPedido)
    VALUES (@ClienteID, @FechaPedido, @EstadoPedido);
END;




CREATE PROCEDURE spAñadirDetallePedido
    @PedidoID INT,
    @ProductoID INT,
    @Cantidad INT,
    @PrecioUnitario DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO DetallePedido (PedidoID, ProductoID, Cantidad, PrecioUnitario)
    VALUES (@PedidoID, @ProductoID, @Cantidad, @PrecioUnitario);
END;




CREATE PROCEDURE spRegistrarOpinionProducto 
    @ClienteID INT,
    @ProductoID INT,
    @Comentario TEXT,
    @Puntuacion INT
AS
BEGIN
    INSERT INTO Opinion (ClienteID, ProductoID, Comentario, Puntuacion)
    VALUES (@ClienteID, @ProductoID, @Comentario, @Puntuacion);
END;




CREATE PROCEDURE spProcesarEnvioPedido
    @PedidoID INT,
    @DireccionEnvio TEXT,
    @MetodoEnvio VARCHAR(50),
    @EstadoEnvio VARCHAR(50) = 'Enviado'
AS
BEGIN
    INSERT INTO Envio (PedidoID, DireccionEnvio, MetodoEnvio, EstadoEnvio)
    VALUES (@PedidoID, @DireccionEnvio, @MetodoEnvio, @EstadoEnvio);
END;
