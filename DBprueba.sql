Create database tienda;

show databases;
use tienda;

CREATE table usuarios 
(
user_id int not null auto_increment,
nombre varchar (255),
correo varchar (255),
edad int,
primary key (user_id)
);

CREATE table productos 
(
prod_id int not null auto_increment,
nombre varchar (255), 
precio varchar (255),
categoria varchar (255),
primary key (prod_id)
);

CREATE table pedidos 
(
order_id int not null auto_increment, 
cantidad varchar (255),
fecha_pedido varchar (255),
user_id int,
prod_id int,
primary key (order_id),
foreign key (user_id) references usuarios(user_id),
foreign key (prod_id) references productos(prod_id)
);

insert into usuarios (nombre, correo, edad)
values
	('Juan Pérez', 'juan@example.com', 30),  
	('María García', 'maria@example.com', 25),
	('Carlos López', 'carlos@example.com', 35),
	('Ana Martínez', 'ana@example.com', 28),
	('Luis Rodríguez', 'luis@example.com', 40);

select * from usuarios;
insert into productos (nombre, precio, categoria)
values
	('Laptop Acer Aspire 5', 800, 'Computadoras'),
	('Samsung Galaxy S21', 1000, 'Dispositivos '),    
	('Apple Watch Series 7', 400, 'Accesorios portátiles'),    
	('Auriculares inalámbricos Sony WH-1000XM4', 350, 'Accesorios de audio'),    
	('PlayStation 5', 500, 'Videojuegos');

select * from productos;

insert into pedidos (cantidad, fecha_pedido, user_id, prod_id)
values
	('1', '2024-03-13', 1, 1),  
	('2', '2024-02-13', 2, 2),    
	('2', '2023-10-20', 3, 3),    
	('3', '2024-01-14', 4, 4),    
	('1', '2024-02-19', 5, 5),
    ('2', '2023-08-14', 3, 2),    
	('3', '2023-12-30', 1, 4);

select * from pedidos;
ALTER TABLE pedidos MODIFY cantidad INT;
UPDATE usuarios SET correo = 'juan@gmail.com' WHERE user_id = 1;
DELETE FROM pedidos WHERE order_id = 7;