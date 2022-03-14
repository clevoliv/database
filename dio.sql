CREATE TABLE pessoas (
id INT NOT NULL PRIMARY KEY AUTOINCREMENT,
pessoa VARCHAR(30) NOT NULL,
nascimento DATE

)

INSERT INTO pessoas (nome, nascimento) VALUES ('Nathally', '1990-05-22');
INSERT INTO pessoas (nome, nascimento) VALUES ('Joel', '1994-07-20');
INSERT INTO pessoas (nome, nascimento) VALUES ('Ligia', '1985-08-10');

UPDATE pessoa SET nome='Nathally Souza' WHERE id=1;
UPDATE pessoa SET nome='Joel SouzBarbosa' WHERE id=2;
UPDATE pessoa SET nome='Ligia Fagundes' WHERE id=3;

SELECT * FROM pessoa ORDER BY nome;

ALTER TABLE pessoa ADD genero VARCHAR(1) NOT NULL AFTER nascimento

UPDATE pessoa SET genero='M' WHERE id=2;

SELECT COUNT(id), genero FROM pessoa GROUP BY genero;

INSERT INTO pessoa (nome, nascimento, genero) VALUES ('Paula Souza', '2008-10-15','F')