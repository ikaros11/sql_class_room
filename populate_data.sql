
-- Insertar datos en materias
INSERT INTO materias (nombre)
VALUES 
('Matemáticas'), ('Ciencias'), ('Historia'), ('Lengua'), ('Geografía'),
('Física'), ('Química'), ('Biología'), ('Filosofía'), ('Economía');

-- Insertar datos en profesores
INSERT INTO profesores (nombre, materia_id)
VALUES 
('Prof. García', 1), ('Prof. López', 2), ('Prof. Martínez', 3),
('Prof. Pérez', 4), ('Prof. Sánchez', 5), ('Prof. Torres', 6),
('Prof. Ramírez', 7), ('Prof. Díaz', 8), ('Prof. Muñoz', 9),
('Prof. González', 10);

-- Insertar datos en alumnos
INSERT INTO alumnos (nombre)
VALUES 
('Juan Pérez'), ('Ana Rodríguez'), ('Luis García'), ('María López'), 
('Carlos Fernández'), ('Laura Sánchez'), ('Marta Gómez'), ('Pablo Ortega'),
('Sofía Ruiz'), ('Isabel Díaz'), ('Pedro Martínez'), ('Alberto Gutiérrez'),
('Cristina Moreno'), ('Rosa Jiménez'), ('Tomás Navarro'), ('Raúl Torres'),
('Javier Santos'), ('Andrés Ramírez'), ('Beatriz Ortega'), ('Lucía Fernández'),
('Iván Lozano'), ('Miguel Álvarez'), ('Fernando Ríos'), ('Daniel Ramos'),
('Victoria Muñoz'), ('Camila Gómez'), ('Alejandro Vargas'), ('Carolina Varela'),
('Patricia Mendoza'), ('Emilio Castro');

-- Insertar datos en notas (más de 100 registros)
INSERT INTO notas (alumno_id, materia_id, nota)
VALUES 
(1, 1, 85.0), (2, 1, 90.0), (3, 1, 78.0), (4, 1, 85.0), (5, 1, 70.0),
(6, 1, 92.0), (7, 1, 88.0), (8, 1, 75.0), (9, 1, 89.0), (10, 1, 81.0),
(11, 1, 77.0), (12, 1, 84.0), (13, 1, 93.0), (14, 1, 87.0), (15, 1, 68.0),
(16, 1, 91.0), (17, 1, 82.0), (18, 1, 79.0), (19, 1, 86.0), (20, 1, 76.0),
(1, 2, 75.0), (2, 2, 88.0), (3, 2, 92.0), (4, 2, 79.0), (5, 2, 83.0),
(6, 2, 71.0), (7, 2, 95.0), (8, 2, 89.0), (9, 2, 80.0), (10, 2, 78.0),
(11, 2, 84.0), (12, 2, 86.0), (13, 2, 94.0), (14, 2, 85.0), (15, 2, 73.0),
(16, 2, 82.0), (17, 2, 77.0), (18, 2, 81.0), (19, 2, 87.0), (20, 2, 93.0),
(1, 3, 80.0), (2, 3, 83.0), (3, 3, 91.0), (4, 3, 76.0), (5, 3, 85.0),
(6, 3, 90.0), (7, 3, 78.0), (8, 3, 84.0), (9, 3, 92.0), (10, 3, 75.0),
(11, 3, 89.0), (12, 3, 79.0), (13, 3, 88.0), (14, 3, 81.0), (15, 3, 86.0),
(21, 4, 85.0), (22, 4, 79.0), (23, 4, 87.0), (24, 4, 92.0), (25, 4, 81.0);

-- Insertar datos en dim_alumnos
INSERT INTO dim_alumnos (nombre)
VALUES 
('Juan Pérez'), ('Ana Rodríguez'), ('Luis García'), ('María López'), 
('Carlos Fernández'), ('Laura Sánchez'), ('Marta Gómez'), ('Pablo Ortega'),
('Sofía Ruiz'), ('Isabel Díaz'), ('Pedro Martínez'), ('Alberto Gutiérrez'),
('Cristina Moreno'), ('Rosa Jiménez'), ('Tomás Navarro'), ('Raúl Torres'),
('Javier Santos'), ('Andrés Ramírez'), ('Beatriz Ortega'), ('Lucía Fernández'),
('Iván Lozano'), ('Miguel Álvarez'), ('Fernando Ríos'), ('Daniel Ramos'),
('Victoria Muñoz'), ('Camila Gómez'), ('Alejandro Vargas'), ('Carolina Varela'),
('Patricia Mendoza'), ('Emilio Castro');

-- Insertar datos en dim_materias
INSERT INTO dim_materias (nombre)
VALUES 
('Matemáticas'), ('Ciencias'), ('Historia'), ('Lengua'), ('Geografía'),
('Física'), ('Química'), ('Biología'), ('Filosofía'), ('Economía');

-- Insertar datos en dim_profesores
INSERT INTO dim_profesores (nombre, materia_id)
VALUES 
('Prof. García', 1), ('Prof. López', 2), ('Prof. Martínez', 3),
('Prof. Pérez', 4), ('Prof. Sánchez', 5), ('Prof. Torres', 6),
('Prof. Ramírez', 7), ('Prof. Díaz', 8), ('Prof. Muñoz', 9),
('Prof. González', 10);

-- Insertar datos en dim_fechas
INSERT INTO dim_fechas (fecha, año, mes, día)
VALUES 
('2024-09-10', 2024, 9, 10), ('2024-09-11', 2024, 9, 11), ('2024-09-12', 2024, 9, 12),
('2024-09-13', 2024, 9, 13), ('2024-09-14', 2024, 9, 14), ('2024-09-15', 2024, 9, 15),
('2024-09-16', 2024, 9, 16), ('2024-09-17', 2024, 9, 17), ('2024-09-18', 2024, 9, 18),
('2024-09-19', 2024, 9, 19), ('2024-09-20', 2024, 9, 20);

-- Insertar datos en hechos_notas
INSERT INTO hechos_notas (alumno_id, materia_id, profesor_id, fecha_id, nota)
VALUES 
(1, 1, 1, 1, 85.0), (2, 1, 1, 2, 90.0), (3, 1, 1, 3, 78.0), (4, 1, 1, 4, 85.0),
(5, 1, 1, 5, 70.0), (6, 1, 1, 6, 92.0), (7, 1, 1, 7, 88.0), (8, 1, 1, 8, 75.0),
(9, 1, 1, 9, 89.0), (10, 1, 1, 10, 81.0), (11, 2, 2, 1, 77.0), (12, 2, 2, 2, 84.0),
(13, 3, 3, 3, 93.0), (14, 3, 3, 4, 87.0), (15, 3, 3, 5, 68.0), (16, 3, 3, 6, 91.0),
(17, 4, 4, 7, 82.0), (18, 4, 4, 8, 79.0), (19, 4, 4, 9, 86.0), (20, 4, 4, 10, 76.0);
