/*Se crea la base de datos */
drop schema if exists veterinaria;
drop user if exists usuario_prueba;
CREATE SCHEMA veterinaria ;

/*Se crea un usuario para la base de datos llamado "usuario_prueba" y tiene la contraseña "Usuario_Clave."*/
create user 'usuario_prueba'@'%' identified by 'Usuar1o_Clave.';

/*Se asignan los prvilegios sobr ela base de datos TechShop al usuario creado */
grant all privileges on veterinaria.* to 'usuario_prueba'@'%';
flush privileges;

/* la tabla de categoria contiene categorias de productos*/
create table veterinaria.categoria (
  id_categoria INT NOT NULL AUTO_INCREMENT,
  descripcion VARCHAR(30) NOT NULL,
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table veterinaria.producto (
  id_producto INT NOT NULL AUTO_INCREMENT,
  id_categoria INT NOT NULL,
  descripcion VARCHAR(30) NOT NULL,  
  detalle VARCHAR(1600) NOT NULL, 
  precio double,
  existencias int,  
  ruta_imagen varchar(1024),
  activo bool,
  PRIMARY KEY (id_producto),
  foreign key fk_producto_caregoria (id_categoria) references categoria(id_categoria)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se crea la tabla de clientes llamada cliente... igual que la clase Cliente */
CREATE TABLE veterinaria.usuario (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  password varchar(512) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellidos VARCHAR(30) NOT NULL,
  correo VARCHAR(25) NULL,
  telefono VARCHAR(15) NULL,
  ruta_imagen varchar(1024),
  activo boolean,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table veterinaria.factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha date,  
  total double,
  estado int,
  PRIMARY KEY (id_factura),
  foreign key fk_factura_usuario (id_usuario) references usuario(id_usuario)  
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

create table veterinaria.venta (
  id_venta INT NOT NULL AUTO_INCREMENT,
  id_factura INT NOT NULL,
  id_producto INT NOT NULL,
  precio double, 
  cantidad int,
  PRIMARY KEY (id_venta),
  foreign key fk_ventas_factura (id_factura) references factura(id_factura),
  foreign key fk_ventas_producto (id_producto) references producto(id_producto) 
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

/*Se insertan 3 registros en la tabla cliente como ejemplo */
INSERT INTO veterinaria.usuario (id_usuario, username,password,nombre, apellidos, correo, telefono,ruta_imagen,activo) VALUES 
(1,'juan','$2a$10$P1.w58XvnaYQUQgZUCk4aO/RTRl8EValluCqB3S2VMLTbRt.tlre.','Juan', 'Castro Mora',    'jcastro@gmail.com',    '4556-8978', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Juan_Diego_Madrigal.jpg/250px-Juan_Diego_Madrigal.jpg',true),
(2,'rebeca','$2a$10$GkEj.ZzmQa/aEfDmtLIh3udIH5fMphx/35d0EYeqZL5uzgCJ0lQRi','Rebeca',  'Contreras Mora', 'acontreras@gmail.com', '5456-8789','https://upload.wikimedia.org/wikipedia/commons/0/06/Photo_of_Rebeca_Arthur.jpg',true),
(3,'pedro','$2a$10$koGR7eS22Pv5KdaVJKDcge04ZB53iMiw76.UjHPY.XyVYlYqXnPbO','Pedro', 'Mena Loria',     'lmena@gmail.com',      '7898-8936','https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Eduardo_de_Pedro_2019.jpg/480px-Eduardo_de_Pedro_2019.jpg?20200109230854',true);

/*Se insertan 3 categorias de productos como ejemplo */
INSERT INTO veterinaria.categoria (id_categoria,descripcion,ruta_imagen,activo) VALUES 
('1','Alimento', 'https://www.prensalibre.com/wp-content/uploads/2020/01/shutterstock_154805255.jpg?quality=52&w=760&h=430&crop=1', true), 
('2','Juguetes',  'https://www.telemundo.com/sites/nbcutelemundo/files/images/article/cover/2020/11/02/perro-mordiendo-juguetes.jpg', true),
('3','Medicinas','https://walac.pe/wp-content/uploads/2019/02/MASCOTAS.jpg',true),
('4','Galletas/Treats','https://mivete.com/wp-content/uploads/2022/01/6104-PupTarts-Dog-Treats-Chicken-Flavor_v2.png',true);

/*Se insertan 4 productos por categoria */
INSERT INTO veterinaria.producto (id_producto,id_categoria,descripcion,detalle,precio,existencias,ruta_imagen,activo) VALUES
(1,1,'Alimento Super Perro','Alimento para perro adulto 18K',20000, 5,'https://c.pxhere.com/images/ec/fd/d67b367ed6467eb826842ac81d3b-1453591.jpg!d',true),
(2,1,'Alimento DogChow','Alimento DogChow para cachorro 4k',7000,2,'https://c.pxhere.com/photos/17/77/Art_Calendar_Cc0_Creative_Design_High_Resolution_Mac_Stock-1622403.jpg!d',true),
(3,1,'Alimento Gati','Alimento para gato adulto 8k',10000,5,'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/09/LG-OLED-Flex-7-scaled.jpg',true),
(4,1,'Alimento Blance Gato','Alimento balance gato adulto 4k',5000,2,'https://www.lg.com/us/images/tvs/md08003300/gallery/D-01.jpg',true),
(5,2,'Soga de Juguete','Soga de juguete para perro',2500,5,'https://http2.mlstatic.com/D_NQ_NP_984317-MLA43206062255_082020-O.webp',true),
(6,2,'Bola de Goma','Bola de goma apta para cachorros.',3000,2,'https://psycatgames.com/magazine/party-games/gaming-trivia/feature-image_hu1c2b511a5a2ca80ffc557d83cb5157c1_380853_1200x1200_fill_q100_box_smart1.jpg',true),
(7,2,'Poste para Arañar','Poste para gato para añarar',5000,5,'https://live.staticflickr.com/7010/26783973491_3e2043edda_b.jpg',true),
(8,2,'Juguete Plumas','Juguete palo con plumas para gato',2500,2,'https://hardzone.es/app/uploads-hardzone.es/2020/10/Mejores-KVM.jpg',true),
(9,3,'Simparica','Pastilla desparasitante para perros 5-10k', 8000,5,'https://live.staticflickr.com/7391/9662276651_f4aa27d5ca_b.jpg',true),
(10,3,'Endogard','Pastilla desparasitante para perros mayores a 10k',11000,2,'https://live.staticflickr.com/1473/24714440462_31a0fcdfba_b.jpg',true),
(11,3,'Nutricell','Suplemento nutricional',15000,5,'https://upload.wikimedia.org/wikipedia/commons/0/0c/AMD_Ryzen_9_3900X_-_ISO.jpg',true),
(12,3,'Endogard','Pastilla desparasitante para perros 5-10k',8500,3,'https://upload.wikimedia.org/wikipedia/commons/a/a0/AMD_Duron_850_MHz_D850AUT1B.jpg',true),
(13,4,'Biscrok','Premios Biscrok Pedigree',5000, 5,'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/08/S22-app-drawer-scaled.jpg',true),
(14,4,'Dental Care','Premios Dental Care Super Perro',4000,9,'https://www.trustedreviews.com/wp-content/uploads/sites/54/2021/10/motorola-2.jpg',true),
(15,4,'Temptations','Premios Temptations Whiskas',3000,7,'https://www.trustedreviews.com/wp-content/uploads/sites/54/2021/08/nokia-xr20-1.jpg',true),
(16,4,'Sticks','Premios Sticks Whiskas',2000,1,'https://www.trustedreviews.com/wp-content/uploads/sites/54/2022/03/20220315_104812-1-scaled.jpg',true);


/*Se crean 6 facturas */   /*'Activa','Pagada','Anulada')*/
INSERT INTO veterinaria.factura (id_factura,id_usuario,fecha,total,estado) VALUES
(1,1,'2022-01-05',211560,2),
(2,2,'2022-01-07',554340,2),
(3,3,'2022-01-07',871000,2),
(4,1,'2022-01-15',244140,1),
(5,2,'2022-01-17',414800,1),
(6,3,'2022-01-21',420000,1);

INSERT INTO veterinaria.venta (id_venta,id_factura,id_producto,precio,cantidad) values
(1,1,5,45000,3),
(2,1,9,15780,2),
(3,1,10,15000,3),
(4,2,5,45000,1),
(5,2,14,154000,3),
(6,2,9,15780,3),
(7,3,14,154000,1),
(8,3,6,57000,1),
(9,3,15,330000,2),
(10,1,6,57000,2),
(11,1,8,27600,3),
(12,1,9,15780,3),
(13,2,8,27600,3),
(14,2,14,154000,2),
(15,2,3,24000,1),
(16,3,15,330000,1),
(17,3,12,45000,1),
(18,3,10,15000,3);

create table veterinaria.rol (
  id_rol INT NOT NULL AUTO_INCREMENT,
  nombre varchar(20),
  id_usuario int,
  PRIMARY KEY (id_rol),
  foreign key fk_rol_usuario (id_usuario) references usuario(id_usuario)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

insert into veterinaria.rol (id_rol, nombre, id_usuario) values
 (1,'ROLE_ADMIN',1), (2,'ROLE_VENDEDOR',1), (3,'ROLE_USER',1),
 (4,'ROLE_VENDEDOR',2), (5,'ROLE_USER',2),
 (6,'ROLE_USER',3);