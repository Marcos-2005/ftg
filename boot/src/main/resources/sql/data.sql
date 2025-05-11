INSERT INTO administradores (username, password_hash, name) VALUES
('admin1', 'hash1', 'Carlos Méndez'),
('admin2', 'hash2', 'Lucía Torres'),
('admin3', 'hash3', 'Pedro Salas');

INSERT INTO clientes (name, dni, phone, email, address) VALUES
('Juan Pérez', '12345678A', '600123456', 'juan.perez@example.com', 'Calle Falsa 123'),
('Ana Gómez', '87654321B', '699987654', 'ana.gomez@example.com', 'Avenida Siempre Viva 742');

INSERT INTO dispositivos (type, brand, model, serial_number, description, image_url, client_id) VALUES
('Laptop', 'Dell', 'XPS 13', 'SN1234', 'Pantalla rota', 'http://example.com/img1.jpg', 1),
('Teléfono', 'Samsung', 'Galaxy S21', 'SN5678', 'No enciende', 'http://example.com/img2.jpg', 2),
('Tablet', 'Apple', 'iPad Air', 'SN91011', 'No carga', 'http://example.com/img3.jpg', 2);

INSERT INTO empresas (name, address, phone, email, iva_rate, welcome_message, completion_message, admin_id) VALUES
('Informática Total', 'Calle Real 45', '910000111', 'contacto@informaticatotal.com', 21.00, 'Gracias por confiar en nosotros', 'Reparación completada con éxito', 1),
('TechMóvil Express', 'Paseo Central 77', '920000222', 'soporte@techmovil.com', 18.00, 'Bienvenido a TechMóvil', 'Gracias por su visita', 2);

INSERT INTO ordenes_servicios (entry_date, status, difficulty, cost, device_id, admin_id) VALUES
('2025-05-01 10:00:00', 'PENDING', 'MEDIUM', 150.00, 1, 1),
('2025-05-03 11:30:00', 'IN_PROGRESS', 'HARD', 200.00, 2, 2),
('2025-05-04 09:45:00', 'PENDING', 'EASY', 100.00, 3, 3),
('2025-05-06 12:00:00', 'COMPLETED', 'HARD', 170.00, 2, 1);

INSERT INTO diagnosticos (service_order_id, description, final_cost, admin_id) VALUES
(1, 'Cambio de pantalla y limpieza interna', 180.00, 1),
(2, 'Sustitución de placa base', 240.00, 2),
(3, 'Reemplazo de batería', 110.00, 3),
(4, 'Reinstalación de sistema operativo', 130.00, 1);

INSERT INTO citas (client_id, admin_id, scheduled_at, description) VALUES
(1, 1, '2025-05-05 09:00:00', 'Diagnóstico de portátil'),
(2, 2, '2025-05-06 15:00:00', 'Revisión de móvil'),
(1, 1, '2025-05-08 11:00:00', 'Entrega de dispositivo');

SELECT * FROM administradores;