Ejemplo de Trigger DML

CREATE TRIGGER trgAfterInsertCliente
ON Clientes
AFTER INSERT
AS
BEGIN
INSERT INTO RegistroClientes (ClienteID, FechaRegistro)
SELECT ClienteID, GETDATE() FROM inserted;
END;


Ejemplo de Trigger DDL

CREATE TRIGGER trgAfterCreateTable
ON DATABASE
FOR CREATE_TABLE
AS
BEGIN
DECLARE @TableName NVARCHAR(128);
SET @TableName =
EVENTDATA().value('[/EVENT_INSTANCE/ObjectName](1)',
'NVARCHAR(128)');
INSERT INTO RegistroTablas (NombreTabla, FechaCreacion)
VALUES (@TableName, GETDATE());
END;


 Actualizar un Registro Después de una Inserción

CREATE TRIGGER trgActualizarInventario
ON Pedidos
AFTER INSERT
AS
BEGIN
UPDATE Inventario
SET Cantidad = Cantidad - (SELECT Cantidad FROM inserted WHERE
Inventario.ProductoID = inserted.ProductoID)
WHERE ProductoID IN (SELECT ProductoID FROM inserted);
END;

