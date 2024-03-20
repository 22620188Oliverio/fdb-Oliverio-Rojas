create database if not exists Hotel;
create table if not exists Hotel.empleado(
	ID_empleado INT NOT NULL auto_increment,
    nombre varchar(50) not null,
    fecha_contratacion varchar(50) NOT NULL,
    rol enum('matutino','vespertino'),
    PRiMARY KEY (id_empleado)
    
);

CREATE TABLE if not exists Hotel.reserva (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_habitacion INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado_reserva VARCHAR(20),
    metodo_pago VARCHAR(50),
    precio_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_habitacion) REFERENCES Habitacion(id_habitacion)
);

CREATE TABLE if not exists Hotel.habitacion (
    id_habitacion INT PRIMARY KEY AUTO_INCREMENT,
    tipo_habitacion VARCHAR(50),
    estado_disponibilidad VARCHAR(20),
    precio_noche DECIMAL(10, 2),
    capacidad INT,
    descripcion TEXT
);