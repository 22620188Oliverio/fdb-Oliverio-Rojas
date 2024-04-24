create database if not exists hotel;
create table if not exists hotel.empleado(
	id_empleado INT NOT NULL AUTO_INCREMENT,
	nombre varchar(30) NOT NULL,
    fecha_contratacion date,
    turno enum('matutino', 'vespertino'),
    telefono varchar(10),
    primary key (id_empleado)
);

create table if not exists hotel.cliente(
	id_cliente INT NOT NULL AUTO_INCREMENT,
	nombre varchar (30) not null,
    correo varchar (30),
    telefono varchar(10)  not null,
    direccion varchar (50),
    primary key(id_cliente)
);

create table if not exists hotel.habitacion(
	id_habitacion INT not null AUTO_INCREMENT,
    precio varchar(30) not null,
    habitacion_tipo varchar(50) not null,
    capacidad varchar (30) not null,
    disponibilidad enum('ocupado','vacio') not null,
    primary key(id_habitacion)
);

create table if not exists hotel.reserva(
	id_reserva INT NOT NULL AUTO_INCREMENT,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    estado_reserva enum('cancelada', 'aprobada') not null,
    fecha_creacion timestamp default current_timestamp,
    precio_total varchar(50) not null,
    id_habitacion int not null,
    id_cliente int not null,
    id_empleado int not null,
    primary key(id_reserva)
);

ALTER TABLE hotel.reserva add foreign key (id_habitacion) references hotel.habitacion(id_habitacion)ON UPDATE CASCADE  ON DELETE CASCADE;
ALTER TABLE hotel.reserva add foreign key(id_cliente)references hotel.cliente(id_cliente)ON UPDATE CASCADE  ON DELETE CASCADE;
ALTER TABLE hotel.reserva add foreign key(id_empleado)references hotel.empleado(id_empleado)ON UPDATE CASCADE  ON DELETE CASCADE;

-- Datos  para la tabla hotel.empleado
INSERT INTO hotel.empleado (nombre, fecha_contratacion, turno, telefono) VALUES
('Juan Pérez', '2023-01-15', 'matutino', '1234567890'),
('María García', '2023-02-20', 'vespertino', '9876543210'),
('Pedro López', '2023-03-25', 'matutino', '5551112233'),
('Carlos González', '2023-04-10', 'matutino', '9998887777'),
('Sofía Rodríguez', '2023-05-15', 'vespertino', '3332221111'),
('Alejandro Díaz', '2023-06-20', 'matutino', '6665554444'),
('Elena Martín', '2023-07-25', 'vespertino', '1112223333'),
('Diego Pérez', '2023-08-30', 'matutino', '4445556666'),
('Valeria Gómez', '2023-09-05', 'vespertino', '7778889999'),
('Andrés López', '2023-10-10', 'matutino', '2223334444');

-- Datos de ejemplo para la tabla hotel.cliente
INSERT INTO hotel.cliente (nombre, correo, telefono, direccion) VALUES
('Ana Martínez', 'ana@example.com', '1112223333', 'Calle Principal #123'),
('Luis Hernández', 'luis@example.com', '4445556666', 'Avenida Central #456'),
('Laura Gómez', 'laura@example.com', '7778889999', 'Plaza Mayor #789'),
('Pablo Ramírez', 'pablo@example.com', '9998887777', 'Calle Principal #456'),
('Carmen Flores', 'carmen@example.com', '3332221111', 'Avenida Central #789'),
('Javier Ruiz', 'javier@example.com', '6665554444', 'Plaza Mayor #123'),
('Andrea Castro', 'andrea@example.com', '1112223333', 'Calle Principal #456'),
('Martín Soto', 'martin@example.com', '4445556666', 'Avenida Central #789'),
('Natalia Vargas', 'natalia@example.com', '7778889999', 'Plaza Mayor #123'),
('Roberto Morales', 'roberto@example.com', '2223334444', 'Calle Principal #456');

-- Datos para la tabla hotel.habitacion
INSERT INTO hotel.habitacion (precio, habitacion_tipo, capacidad, disponibilidad) VALUES
('100', 'Individual', '1', 'vacio'),
('150', 'Doble', '2', 'vacio'),
('200', 'Suite', '4', 'vacio'),
('120', 'Individual', '1', 'vacio'),
('180', 'Doble', '2', 'vacio'),
('250', 'Suite', '4', 'vacio'),
('130', 'Individual', '1', 'vacio'),
('200', 'Doble', '2', 'vacio'),
('270', 'Suite', '4', 'vacio'),
('140', 'Individual', '1', 'vacio');

-- Datos la tabla hotel.reserva
INSERT INTO hotel.reserva (fecha_inicio, fecha_fin, estado_reserva, precio_total, id_habitacion, id_cliente, id_empleado) VALUES
('2024-08-01', '2024-08-05', 'aprobada', '600', 4, 4, 4),
('2024-09-10', '2024-09-15', 'aprobada', '900', 5, 5, 5),
('2024-10-20', '2024-10-25', 'aprobada', '1200', 6, 6, 6),
('2024-11-01', '2024-11-05', 'aprobada', '620', 7, 7, 7),
('2024-12-10', '2024-12-15', 'aprobada', '950', 8, 8, 8),
('2025-01-20', '2025-01-25', 'aprobada', '1250', 9, 9, 9),
('2025-02-01', '2025-02-05', 'aprobada', '640', 10, 10, 10),
('2025-03-10', '2025-03-15', 'aprobada', '970', 1, 1, 1),
('2025-04-20', '2025-04-25', 'aprobada', '1300', 2, 2, 2),
('2025-05-01', '2025-05-05', 'aprobada', '660', 3, 3, 3);




-- Mostrar los datos de la tabla cliente
SELECT * FROM hotel.cliente;
-- Mostrar los datos de la tabla empleado
SELECT * FROM hotel.empleado;
-- Mostrar datos de la habitacion
SELECT * FROM hotel.habitacion;
--  Mostrar datos de la reserva
SELECT * FROM hotel.reserva;

