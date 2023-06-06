--Ejercicio2
CREATE TYPE tFamilia AS OBJECT (
  idFamilia NUMBER,
  familia VARCHAR2(50)
);
--Ejercicio3
CREATE TABLE FAMILIA (
  familia_obj tFamilia,
  CONSTRAINT pk_familia PRIMARY KEY (familia_obj.idFamilia)
);

--Ejercicio4
INSERT INTO FAMILIA VALUES (tFamilia(1, 'Aves'));
INSERT INTO FAMILIA VALUES (tFamilia(2, 'Mamíferos'));
INSERT INTO FAMILIA VALUES (tFamilia(3, 'Peces'));


-- Ejercicio 5
CREATE TYPE tNombres AS VARRAY(20) OF VARCHAR2(50);


-- Ejercicio 6
CREATE TYPE tAnimal AS OBJECT (
  idAnimal NUMBER,
  idFamilia NUMBER,
  Animal VARCHAR2(50),
  nombres tNombres,
  MEMBER FUNCTION ejemplares RETURN VARCHAR2
);

CREATE TYPE BODY tAnimal AS
  MEMBER FUNCTION ejemplares RETURN VARCHAR2 IS
    num_animales NUMBER := self.nombres.COUNT;
    especie VARCHAR2(50) := self.Animal;
    result VARCHAR2(100);
  BEGIN
    -- Construye la cadena de resultado
    result := 'Hay ' || num_animales || ' animales de la especie ' || especie;
    RETURN result;
  END ejemplares;
END;
/
-- Ejercicio 7
CREATE TABLE Animal OF tAnimal;

-- Ejercicio 8
ALTER TABLE Animal ADD CONSTRAINT pk_idAnimal PRIMARY KEY (idAnimal);
ALTER TABLE Animal ADD CONSTRAINT fk_idFamilia FOREIGN KEY (idFamilia) REFERENCES FAMILIA (familia_obj.idFamilia);


-- Ejercicio 9
-- Tres aves
INSERT INTO Animal VALUES (1, 1, 'Garza Real', tNombres('Calíope', 'Izaro'));
INSERT INTO Animal VALUES (2, 1, 'Garza Real', tNombres('Calíope', 'Izaro'));
INSERT INTO Animal VALUES (3, 1, 'Cigüeña Blanca', tNombres('Perica', 'Clara', 'Miranda'));
INSERT INTO Animal VALUES (4, 1, 'Cigüeña Blanca', tNombres('Perica', 'Clara', 'Miranda'));
INSERT INTO Animal VALUES (5, 1, 'Cigüeña Blanca', tNombres('Perica', 'Clara', 'Miranda'));
INSERT INTO Animal VALUES (6, 1, 'Gorrión', tNombres('Coco', 'Roco', 'Loco', 'Peco', 'Rico'));
INSERT INTO Animal VALUES (7, 1, 'Gorrión', tNombres('Coco', 'Roco', 'Loco', 'Peco', 'Rico'));
INSERT INTO Animal VALUES (8, 1, 'Gorrión', tNombres('Coco', 'Roco', 'Loco', 'Peco', 'Rico'));
INSERT INTO Animal VALUES (9, 1, 'Gorrión', tNombres('Coco', 'Roco', 'Loco', 'Peco', 'Rico'));
INSERT INTO Animal VALUES (10, 1, 'Gorrión', tNombres('Coco', 'Roco', 'Loco', 'Peco', 'Rico'));
INSERT INTO Animal VALUES (11, 1, 'Gorrión', tNombres('Coco', 'Roco', 'Loco', 'Peco', 'Rico'));
INSERT INTO Animal VALUES (12, 1, 'Gorrión', tNombres('Coco', 'Roco', 'Loco', 'Peco', 'Rico'));

-- Tres mamíferos
INSERT INTO Animal VALUES (13, 2, 'Zorro', tNombres('Lucas', 'Mario'));
INSERT INTO Animal VALUES (14, 2, 'Zorro', tNombres('Lucas', 'Mario'));
INSERT INTO Animal VALUES (15, 2, 'Lobo', tNombres('Pedro', 'Pablo'));
INSERT INTO Animal VALUES (16, 2, 'Lobo', tNombres('Pedro', 'Pablo'));
INSERT INTO Animal VALUES (17, 2, 'Ciervo', tNombres('Bravo', 'Listo', 'Rojo', 'Astuto'));
INSERT INTO Animal VALUES (18, 2, 'Ciervo', tNombres('Bravo', 'Listo', 'Rojo', 'Astuto'));
INSERT INTO Animal VALUES (19, 2, 'Ciervo', tNombres('Bravo', 'Listo', 'Rojo', 'Astuto'));
INSERT INTO Animal VALUES (20, 2, 'Ciervo', tNombres('Bravo', 'Listo', 'Rojo', 'Astuto'));

-- Tres peces
INSERT INTO Animal VALUES (21, 3, 'Pez globo', tNombres('Nemo', 'Dory'));
INSERT INTO Animal VALUES (22, 3, 'Pez payaso', tNombres('Marlin', 'Coral'));
INSERT INTO Animal VALUES (23, 3, 'Ángel llama', tNombres('Ariel', 'Blaze'));


--Ejercicio 10
SELECT A.Animal, F.familia_obj.familia, A.ejemplares() AS num_ejemplares
FROM Animal A
JOIN FAMILIA F ON A.idFamilia = F.familia_obj.idFamilia;


















