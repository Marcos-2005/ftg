CREATE TABLE IF NOT EXISTS administradores (
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS clientes (
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    dni VARCHAR(20),
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS dispositivo (
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    type VARCHAR(50),
    brand VARCHAR(50),
    model VARCHAR(50),
    serial_number VARCHAR(100),
    description TEXT,
    image_url TEXT,
    client_id BIGINT,
    FOREIGN KEY (client_id) REFERENCES clientes(id)
);

CREATE TABLE IF NOT EXISTS tecnicos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    assigned_orders_count INT DEFAULT 0,
    active BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS ordenes_servicios (
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    entry_date DATETIME,
    status VARCHAR(20),
    difficulty VARCHAR(20),
    cost DECIMAL(10, 2),
    device_id BIGINT,
    technician_id BIGINT,
    FOREIGN KEY (device_id) REFERENCES dispositivo(id),
    FOREIGN KEY (technician_id) REFERENCES tecnicos(id)
);

CREATE TABLE IF NOT EXISTS diagnosticos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    service_order_id BIGINT,
    description TEXT,
    final_cost DECIMAL(10, 2),
    technician_id BIGINT,
    FOREIGN KEY (service_order_id) REFERENCES ordenes_servicios(id),
    FOREIGN KEY (technician_id) REFERENCES tecnicos(id)
);

CREATE TABLE IF NOT EXISTS citas (
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    client_id BIGINT,
    technician_id BIGINT,
    scheduled_at DATETIME,
    description TEXT,
    FOREIGN KEY (client_id) REFERENCES clientes(id),
    FOREIGN KEY (technician_id) REFERENCES tecnicos(id)
);

CREATE TABLE IF NOT EXISTS empresa (
    id BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(100),
    iva_rate DECIMAL(5, 2),
    welcome_message TEXT,
    completion_message TEXT,
    admin_id BIGINT,
    FOREIGN KEY (admin_id) REFERENCES administradores(id)
);

CREATE TABLE IF NOT EXISTS administradores_clientes (
    administrator_id BIGINT,
    client_id BIGINT,
    PRIMARY KEY (administrator_id, client_id),
    FOREIGN KEY (administrator_id) REFERENCES administradores(id),
    FOREIGN KEY (client_id) REFERENCES clientes(id)
);
