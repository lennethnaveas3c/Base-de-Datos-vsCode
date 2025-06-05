INSERT INTO usuarios (nombre_tipo, correo, tipo_usuario_id, created_by, updated_by)
VALUES ('Usuario Sistema', 'sistema@ventas.com', NULL, NULL, NULL);

INSERT INTO tipo_usuarios (nombre_tipo, created_by, updated_by)
VALUES 
('Administrador', 1, 1),
('Vendedor', 1, 1);

-- Juan Pérez (Administrador)
INSERT INTO usuarios (nombre_tipo, correo, tipo_usuario_id, created_by, updated_by)
VALUES ('Juan Pérez', 'juan.perez@ventas.com', 1, 1, 1);

-- Ana Torres (Vendedora)
INSERT INTO usuarios (nombre_tipo, correo, tipo_usuario_id, created_by, updated_by)
VALUES ('Ana Torres', 'ana.torres@ventas.com', 2, 1, 1);

-- Carlos Díaz (Vendedor)
INSERT INTO usuarios (nombre_tipo, correo, tipo_usuario_id, created_by, updated_by)
VALUES ('Carlos Díaz', 'carlos.diaz@ventas.com', 2, 1, 1);



INSERT INTO productos (nombre_producto, precio, stock, created_by, updated_by)
VALUES 
('Laptop Lenovo ThinkPad', 850.00, 10, 2, 2),
('Mouse Logitech M185', 15.50, 50, 2, 2),
('Monitor Samsung 24"', 180.00, 20, 2, 2);


INSERT INTO ventas (fecha, created_by, updated_by)
VALUES 
('2025-05-01', 3, 3),
('2025-05-02', 4, 4);

-- Venta 1 - Ana
INSERT INTO detalle_ventas (producto_id, cantidad, precio_unitario, venta_id, created_by, updated_by)
VALUES 
(1, 1, 850.00, 1, 3, 3), -- Laptop
(2, 2, 15.50, 1, 3, 3); -- Mouse

-- Venta 2 - Carlos
INSERT INTO detalle_ventas (producto_id, cantidad, precio_unitario, venta_id, created_by, updated_by)
VALUES 
(3, 1, 180.00, 2, 4, 4), -- Monitor
(2, 1, 15.50, 2, 4, 4); -- Mouse


SELECT * FROM usuarios;
SELECT * FROM tipo_usuarios;
SELECT * FROM productos;
SELECT * FROM ventas;
SELECT * FROM detalle_ventas;


SELECT * FROM usuarios
WHERE deleted = 0;


SELECT u.* 
FROM usuarios u
JOIN tipo_usuarios t ON u.tipo_usuario_id = t.id
WHERE t.nombre_tipo = 'Administrador' AND u.deleted = FALSE;


SELECT * 
FROM usuarios 
WHERE nombre_tipo LIKE 'A%' AND deleted = FALSE;


SELECT * 
FROM usuarios 
WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31'
AND deleted = FALSE;




SELECT * 
FROM usuarios 
WHERE created_by = 1 AND deleted = FALSE;


SELECT * 
FROM usuarios 
WHERE correo LIKE '%@empresa.com%' AND deleted = FALSE;


SELECT * 
FROM usuarios 
WHERE updated_at >= NOW() - INTERVAL 7 DAY
AND deleted = FALSE;


SELECT u.* 
FROM usuarios u
JOIN tipo_usuarios t ON u.tipo_usuario_id = t.id
WHERE (u.nombre_tipo LIKE '%Juan%' OR t.nombre_tipo = 'Supervisor') 
AND u.deleted = FALSE;