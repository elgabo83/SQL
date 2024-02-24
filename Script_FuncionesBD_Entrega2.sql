CREATE FUNCTION fnPrecioTotalPedido(@PedidoID INT)
RETURNS DECIMAL(12, 2)
AS
BEGIN
    DECLARE @Total DECIMAL(12, 2);
    SELECT @Total = SUM(PrecioUnitario * Cantidad)
    FROM DetallePedido
    WHERE PedidoID = @PedidoID;
    RETURN @Total;
END


CREATE FUNCTION fnContarProductosPorCategoria(@CategoriaID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Cantidad INT;
    SELECT @Cantidad = COUNT(*)
    FROM Producto
    WHERE CategoriaID = @CategoriaID;
    RETURN @Cantidad;
END


CREATE FUNCTION fnValoracionPromedioProducto(@ProductoID INT)
RETURNS DECIMAL(3, 2)
AS
BEGIN
    DECLARE @ValoracionPromedio DECIMAL(3, 2);
    SELECT @ValoracionPromedio = AVG(Puntuacion)
    FROM Opinion
    WHERE ProductoID = @ProductoID;
    RETURN @ValoracionPromedio;
END


CREATE FUNCTION fnStockTotalProducto(@ProductoID INT)
RETURNS INT
AS
BEGIN
    DECLARE @StockTotal INT;
    SELECT @StockTotal = SUM(CantidadStock)
    FROM ProductoTalla
    WHERE ProductoID = @ProductoID;
    RETURN @StockTotal;
END


CREATE FUNCTION fnDisponibilidadProductoTalla(@ProductoID INT, @TallaID INT)
RETURNS BIT
AS
BEGIN
    DECLARE @Disponible BIT;
    SELECT @Disponible = CASE WHEN SUM(CantidadStock) > 0 THEN 1 ELSE 0 END
    FROM ProductoTalla
    WHERE ProductoID = @ProductoID AND TallaID = @TallaID;
    RETURN @Disponible;
END


CREATE FUNCTION fnUltimoPedidoCliente(@ClienteID INT)
RETURNS INT
AS
BEGIN
    DECLARE @UltimoPedidoID INT;
    SELECT TOP 1 @UltimoPedidoID = PedidoID
    FROM Pedido
    WHERE ClienteID = @ClienteID
    ORDER BY FechaPedido DESC;
    RETURN @UltimoPedidoID;
END