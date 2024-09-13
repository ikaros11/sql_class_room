# sql_class_room
# Ejemplo de SQL en SQLite para un Salón de Clases

## 1. Crear Tablas

```sql
CREATE TABLE materias (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL
);

CREATE TABLE profesores (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    materia_id INTEGER,
    FOREIGN KEY (materia_id) REFERENCES materias(id)
);

CREATE TABLE alumnos (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL
);

CREATE TABLE notas (
    id INTEGER PRIMARY KEY,
    alumno_id INTEGER,
    materia_id INTEGER,
    nota REAL,
    FOREIGN KEY (alumno_id) REFERENCES alumnos(id),
    FOREIGN KEY (materia_id) REFERENCES materias(id)
);
```

## 2. Insertar Datos

```sql
-- Insertar materias
INSERT INTO materias (nombre)
VALUES ('Matemáticas'), ('Ciencias'), ('Historia');

-- Insertar profesores
INSERT INTO profesores (nombre, materia_id)
VALUES ('Prof. García', 1), ('Prof. López', 2), ('Prof. Martínez', 3);

-- Insertar alumnos
INSERT INTO alumnos (nombre)
VALUES ('Juan Pérez'), ('Ana Rodríguez'), ('Luis García');

-- Insertar notas
INSERT INTO notas (alumno_id, materia_id, nota)
VALUES (1, 1, 85.0), (1, 2, 78.0), (2, 1, 90.0), (2, 3, 88.0), (3, 2, 70.0), (3, 3, 82.0);
```

## 3. Consultas

### a) Consultar todas las materias con sus respectivos profesores
```sql
SELECT materias.nombre AS materia, profesores.nombre AS profesor
FROM materias
JOIN profesores ON materias.id = profesores.materia_id;
```

### b) Obtener las notas de cada alumno por materia
```sql
SELECT alumnos.nombre AS alumno, materias.nombre AS materia, notas.nota
FROM notas
JOIN alumnos ON notas.alumno_id = alumnos.id
JOIN materias ON notas.materia_id = materias.id;
```

### c) Calcular el promedio de notas de cada alumno
```sql
SELECT alumnos.nombre, AVG(notas.nota) AS promedio
FROM notas
JOIN alumnos ON notas.alumno_id = alumnos.id
GROUP BY alumnos.nombre;
```

### d) Obtener los alumnos con notas superiores a 80 en Matemáticas
```sql
SELECT alumnos.nombre, notas.nota
FROM notas
JOIN alumnos ON notas.alumno_id = alumnos.id
WHERE notas.materia_id = 1 AND notas.nota > 80;
```

### e) Ver el promedio de notas por materia
```sql
SELECT materias.nombre, AVG(notas.nota) AS promedio_nota
FROM notas
JOIN materias ON notas.materia_id = materias.id
GROUP BY materias.nombre;
```

---

# Ejemplo de Modelo Estrella para un Salón de Clases

## 1. Crear Tablas de Dimensiones

```sql
CREATE TABLE dim_alumnos (
    alumno_id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL
);

CREATE TABLE dim_materias (
    materia_id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL
);

CREATE TABLE dim_profesores (
    profesor_id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    materia_id INTEGER,
    FOREIGN KEY (materia_id) REFERENCES dim_materias(materia_id)
);

CREATE TABLE dim_fechas (
    fecha_id INTEGER PRIMARY KEY,
    fecha TEXT NOT NULL,
    año INTEGER,
    mes INTEGER,
    día INTEGER
);
```

## 2. Crear la Tabla de Hechos

```sql
CREATE TABLE hechos_notas (
    nota_id INTEGER PRIMARY KEY,
    alumno_id INTEGER,
    materia_id INTEGER,
    profesor_id INTEGER,
    fecha_id INTEGER,
    nota REAL,
    FOREIGN KEY (alumno_id) REFERENCES dim_alumnos(alumno_id),
    FOREIGN KEY (materia_id) REFERENCES dim_materias(materia_id),
    FOREIGN KEY (profesor_id) REFERENCES dim_profesores(profesor_id),
    FOREIGN KEY (fecha_id) REFERENCES dim_fechas(fecha_id)
);
```

## 3. Insertar Datos en las Tablas de Dimensiones

```sql
-- Insertar datos en dim_alumnos
INSERT INTO dim_alumnos (nombre)
VALUES ('Juan Pérez'), ('Ana Rodríguez'), ('Luis García');

-- Insertar datos en dim_materias
INSERT INTO dim_materias (nombre)
VALUES ('Matemáticas'), ('Ciencias'), ('Historia');

-- Insertar datos en dim_profesores
INSERT INTO dim_profesores (nombre, materia_id)
VALUES ('Prof. García', 1), ('Prof. López', 2), ('Prof. Martínez', 3);

-- Insertar datos en dim_fechas
INSERT INTO dim_fechas (fecha, año, mes, día)
VALUES ('2024-09-10', 2024, 9, 10), ('2024-09-11', 2024, 9, 11), ('2024-09-12', 2024, 9, 12);
```

## 4. Insertar Datos en la Tabla de Hechos

```sql
INSERT INTO hechos_notas (alumno_id, materia_id, profesor_id, fecha_id, nota)
VALUES (1, 1, 1, 1, 85.0), (1, 2, 2, 2, 78.0), (2, 1, 1, 1, 90.0), (2, 3, 3, 3, 88.0), (3, 2, 2, 2, 70.0), (3, 3, 3, 3, 82.0);
```

## 5. Consultas en el Modelo Estrella

### a) Consultar las notas de los alumnos junto con la fecha y el profesor
```sql
SELECT dim_alumnos.nombre AS alumno, dim_materias.nombre AS materia, dim_profesores.nombre AS profesor, dim_fechas.fecha, hechos_notas.nota
FROM hechos_notas
JOIN dim_alumnos ON hechos_notas.alumno_id = dim_alumnos.alumno_id
JOIN dim_materias ON hechos_notas.materia_id = dim_materias.materia_id
JOIN dim_profesores ON hechos_notas.profesor_id = dim_profesores.profesor_id
JOIN dim_fechas ON hechos_notas.fecha_id = dim_fechas.fecha_id;
```

### b) Calcular el promedio de notas por materia
```sql
SELECT dim_materias.nombre AS materia, AVG(hechos_notas.nota) AS promedio_nota
FROM hechos_notas
JOIN dim_materias ON hechos_notas.materia_id = dim_materias.materia_id
GROUP BY dim_materias.nombre;
```

### c) Consultar las notas de un alumno específico en un rango de fechas
```sql
SELECT dim_alumnos.nombre AS alumno, dim_materias.nombre AS materia, dim_fechas.fecha, hechos_notas.nota
FROM hechos_notas
JOIN dim_alumnos ON hechos_notas.alumno_id = dim_alumnos.alumno_id
JOIN dim_materias ON hechos_notas.materia_id = dim_materias.materia_id
JOIN dim_fechas ON hechos_notas.fecha_id = dim_fechas.fecha_id
WHERE dim_alumnos.nombre = 'Juan Pérez' AND dim_fechas.fecha BETWEEN '2024-09-10' AND '2024-09-12';
```

