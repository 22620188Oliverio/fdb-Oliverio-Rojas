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