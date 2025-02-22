create database if not exists coworking;

create type estado_reserva as enum
('pendiente', 'cancelado', 'confirmado');

create type tipo_espacio as enum
('oficinas privadas', 'salas de reuniones', 'escritorios compartidos');

create type disponibilidad_espacios as enum
('activo', 'inactivo');

CREATE TABLE espacios (
    id_espacio SERIAL PRIMARY KEY,
    nombre varchar(100),
    tipo tipo_espacio,
    capacidad int,
    disponibilidad disponibilidad_espacios
) ;

CREATE TABLE reservas (
    id_reserva SERIAL PRIMARY KEY,
    fecha date,
    hora_inicio time,
    hora_fin time,
    estado estado_reserva,
    id_espacios int,
    FOREIGN KEY (id_espacios) references "espacios"(id_espacio)
);

insert into espacios (nombre, tipo, capacidad, disponibilidad)
    values('Marte', 'salas de reuniones', 500, 'activo'),
    ('Jupiter', 'salas de reuniones', 600, 'inactivo'),
    ('Saturno', 'escritorios compartidos', 400, 'activo'),
    ('Urano', 'oficinas privadas', 300, 'inactivo'),
    ('Alpha', 'salas de reuniones', 500, 'activo'),
    ('Centauri', 'escritorios compartidos', 200, 'activo'),
    ('Via Lactea', 'oficinas privadas', 300, 'activo'),
    ('Sistema solar', 'salas de reuniones', 500, 'inactivo'),
    ('Orion', 'escritorios compartidos', 400, 'activo'),
    ('Horcus', 'salas de reuniones', 500, 'activo'),
    ('Deus', 'escritorios compartidos', 300, 'activo');
    
   
insert into reservas (fecha, hora_inicio, hora_fin, estado, id_espacios)
    values('2025-08-18', '12:00:00','14:00:00','cancelado', 11),
    ('2025-08-20', '12:00:00','14:00:00','cancelado', 10),
    ('2025-08-21', '14:00:00','16:00:00','confirmado', 9),
    ('2025-08-22', '16:00:00','18:00:00','cancelado', 8),
    ('2025-08-23', '20:00:00','22:00:00','cancelado', 7),
    ('2025-08-24', '08:00:00','10:00:00','confirmado', 6),
    ('2025-08-25', '12:00:00','14:00:00','confirmado', 5),
    ('2025-08-26', '14:00:00','15:00:00','cancelado', 4),
    ('2025-08-27', '06:00:00','08:00:00','confirmado', 3),
    ('2025-08-28', '19:00:00','22:00:00','confirmado', 2),
    ('2025-08-29', '12:00:00','14:00:00','confirmado', 1);