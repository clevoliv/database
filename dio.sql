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


INSERT INTO videos (author,title,likes,dislike) VALUES ('Maria','MySQL',10,2);
INSERT INTO videos (author,title,likes,dislike) VALUES ('Horacio','HTML 5',22,1);
INSERT INTO videos (author,title,likes,dislike) VALUES ('Sergio','CSS',20,12);
INSERT INTO videos (author,title,likes,dislike) VALUES ('Maria','PHP',10,0);
INSERT INTO videos (author,title,likes,dislike) VALUES ('Pedro','PYTHON',100,2)

SELECT * FROM `videos` JOIN Author;
SELECT * FROM `videos` JOIN Author ON videos.fk_author= Author.id_author;

SELECT videos.title, Author.name FROM `videos` JOIN Author ON videos.fk_author= Author.id_author;

UPDATE videos SET fk_seo=2 WHERE id_video=6;

SELECT * FROM videos JOIN seo ON videos.fk_seo = seo.id_seo;
SELECT videos.title,seo.category FROM videos JOIN seo ON videos.fk_seo = seo.id_seo;

SELECT videos.title,seo.category,Author.name FROM videos JOIN seo ON videos.fk_seo = seo.id_seo 
JOIN Author ON videos.fk_author = Author.id_author;

SELECT * FROM Playlist JOIN videos_playlist ON Playlist.id_playlist = videos_playlist.fk_playlist; 

SELECT * FROM Playlist 
JOIN videos_playlist ON Playlist.id_playlist = videos_playlist.fk_playlist 
JOIN videos ON videos.id_video = videos_playlist.fk_videos; 

SELECT Playlist.name_pl, videos.title FROM Playlist 
JOIN videos_playlist ON Playlist.id_playlist = videos_playlist.fk_playlist 
JOIN videos ON videos.id_video = videos_playlist.fk_videos; 

SELECT Playlist.name_pl, videos.title, Author.name FROM Playlist 
JOIN videos_playlist ON Playlist.id_playlist = videos_playlist.fk_playlist
JOIN videos ON videos.id_video = videos_playlist.fk_videos
JOIN Author ON videos.fk_author= Author.id_author;

SELECT Author.name , Playlist.name_pl FROM Playlist JOIN Author ON Playlist.fk_author = Author.id_author;

SELECT videos_1.nome_videos_1, videos_1.autor_videos_1, canais.nome_canal 
FROM videos_canais JOIN videos_1 ON videos_canais.fk_video = videos_1.id_videos_1
JOIN canais ON videos_canais.fk_canal = canais.id_canal;

SELECT videos_1.id_videos_1, videos_1.nome_videos_1 FROM videos_1 LEFT OUTER JOIN videos_canais ON videos_1.id_videos_1 = videos_canais.fk_video
UNION
SELECT canais.id_canal, canais.nome_canal FROM videos_canais RIGHT OUTER JOIN canais ON videos_canais.fk_canal = canais.id_canal;

SELECT * FROM `videos_canais` JOIN videos_1 ON videos_canais.fk_video = videos_1.id_videos_1
JOIN canais ON videos_canais.fk_canal = canais.id_canal;

SELECT * FROM `videos_canais` JOIN videos_1 ON videos_canais.fk_video = videos_1.id_videos_1
JOIN canais ON videos_canais.fk_canal = canais.id_canal
WHERE canais.id_canal=2;