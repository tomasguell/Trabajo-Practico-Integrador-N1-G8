drop database if exists AlquilerPeliculas;
create database AlquilerPeliculas;
use AlquilerPeliculas;



-- Crear tabla de clientes


CREATE TABLE TipoTarjeta(id INTEGER PRIMARY KEY AUTO_INCREMENT,
tipoTarjeta varchar(30)

);

CREATE TABLE Tarjetas (
  id_tarjeta INTEGER PRIMARY KEY AUTO_INCREMENT,
  banco VARCHAR(50),
  numeroTarjeta INTEGER,
  FechaExpiracion INTEGER,
  email VARCHAR(50),
  tipoTarjeta INTEGER,
  constraint foreign key (tipoTarjeta) references TipoTarjeta (id)

);

CREATE TABLE Clientes (
  id_cliente INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  direccion VARCHAR(100),
  telefono VARCHAR(20),
  email VARCHAR(50),
  tarjeta INTEGER,
  constraint foreign key (tarjeta) references Tarjetas (id_tarjeta)

);


create table Generos(id INTEGER PRIMARY KEY AUTO_INCREMENT,
tipoGenero varchar(30)
);

create table Directores(id INTEGER PRIMARY KEY AUTO_INCREMENT,
nombre varchar(30)
);

create table ClasificacionEdades(id INTEGER PRIMARY KEY AUTO_INCREMENT,
tipoClasificacion varchar(30)

);






-- Crear tabla de películas
CREATE TABLE Peliculas (
  id_pelicula INTEGER PRIMARY KEY,
  titulo VARCHAR(100),
  director INTEGER,
  genero INTEGER,
  descripcion TEXT,
  clasificacion_edad INTEGER,
  duracion INTEGER,
  precio_renta FLOAT,
  constraint foreign key (director) references Directores (id),
  constraint foreign key (genero) references Generos (id),
  constraint foreign key (clasificacion_edad) references ClasificacionEdades (id)
);

-- Crear tabla de tiendas
CREATE TABLE Tiendas (
  id_tienda INTEGER PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  direccion VARCHAR(100),
  telefono VARCHAR(20),
  email VARCHAR(50)
);



CREATE TABLE Tiendas_Peliculas(id INTEGER PRIMARY KEY AUTO_INCREMENT,
id_tienda INTEGER,
id_pelicula INTEGER,
numeroCopias INTEGER,
constraint foreign key (id_tienda) references Tiendas (id_tienda),
  constraint foreign key (id_pelicula) references Peliculas (id_pelicula)

);



-- Crear tabla de rentas
CREATE TABLE Alquileres (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  id_cliente INTEGER,

  fecha_inicio DATE,
  duracion INTEGER,

  estado_devolucion INTEGER,
  FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente)
  
  
);

-- Crear tabla de detalles de rentas
CREATE TABLE detalles(
  id_alquiler INTEGER,
  id_tiendaPelicula INTEGER ,
  
  FOREIGN KEY (id_alquiler) REFERENCES Alquileres (id),
  FOREIGN KEY (id_tiendaPelicula) REFERENCES Tiendas_Peliculas (id)
);


