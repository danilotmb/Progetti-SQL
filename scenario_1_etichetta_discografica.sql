drop database es1;
create database es1;
use es1;

CREATE TABLE IF NOT EXISTS albums (
  album_id int(11) NOT NULL,
  album_nome varchar(255) NOT NULL,
  artista_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO albums (album_id, album_nome, artista_id) VALUES
(1, "No Limit Top Dogg", 2),
(2, "Sonic Highways", 1),
(3, "Sale el sol", 3);


CREATE TABLE IF NOT EXISTS albums_generi (
  album_id int(11) NOT NULL,
  genere_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO albums_generi (album_id, genere_id) VALUES
(1, 3),
(2, 1),
(3, 2);


CREATE TABLE IF NOT EXISTS artisti (
  artista_id int(11) NOT NULL,
  artista_name varchar(255) NOT NULL,
  artista_bio text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO artisti (artista_id, artista_name, artista_bio) VALUES
(1, "Foo Fighters", "I Foo Fighters sono un gruppo musicale rock alternativo statunitense fondato a Seattle nel 1994 dal musicista Dave Grohl, ex batterista dei Nirvana."),
(2, "Snoop Dogg", "Noto per il suo flow melodico, la sua musicalità ha permesso la diffusione del g-funk, in particolare in collaborazione con il collega Dr. Dre."),
(3, "Shakira", "Annoverata tra i principali esponenti del pop latino, ha debuttato nel mercato discografico latinoamericano nel 1991, dominandone la scena per oltre un decennio.");


CREATE TABLE IF NOT EXISTS brani (
  brano_id int(11) NOT NULL,
  brano_titolo varchar(255) NOT NULL,
  brano_durata time NOT NULL,
  album_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO brani (brano_id, brano_titolo, brano_durata, album_id) VALUES
(1, "Something from Nothing", "00:01:00", 2),
(2, "The Feast and the Famine", "00:08:13", 2),
(3, "Congregation", "00:04:22", 2),
(4, "What Did I Do?/God as My Witness", "00:02:42", 2),
(5, "Outside", "00:05:11", 2),
(6, "In the Clear", "00:04:14", 2),
(7, "Subterranean", "00:03:45", 2),
(8, "Dolomite", "00:02:09", 1),
(9, "I Am a River", "00:03:33", 2),
(10, "Buck \"Em (feat. Sticky Fingaz)", "00:05:10", 1),
(11, "Trust Me (feat. Suga Free, Sylk-E. Fyne)", "00:02:49", 1),
(12, "My Heat Goes Boom", "00:03:23", 1),
(13, "Dolomite (Interlude)", "00:05:01", 1),
(14, "Sale el sol", "00:00:00", 3),
(15, "Loca (feat. El Cata)", "00:04:21", 3),
(16, "Antes de las seis", "00:03:26", 3),
(17, "Snoopafella", "00:03:58", 1),
(18, "In Love With A Thug", "00:09:14", 1),
(19, "G Bedtime Stories", "00:02:14", 1),
(20, "Down 4 My Niggaz (feat. C-Murder, Magic)", "00:03:24", 1),
(21, "Gordita (feat. Residente dei Calle 13)", "00:03:22", 3),
(22, "Addicted to You", "00:03:35", 3),
(23, "Betta Days", "00:02:12", 1),
(24, "Lo que más", "00:06:16", 3),
(25, "Mariposas", "00:02:30", 3),
(26, "Rabiosa (feat. El Cata)", "00:10:24", 3),
(27, "Somethin\" Bout Yo Bidness (feat. Raphael Saadiq)", "00:03:32", 1),
(28, "Bitch Please (feat. Xzibit, Nate Dogg) (Produced By Dr. Dre)", "00:34:19", 1),
(29, "Devoción", "00:03:14", 3),
(30, "Islands", "00:07:03", 3),
(31, "Doin\" Too Much", "00:02:45", 1),
(32, "Gangsta Ride (feat. Silkk the Shocker)", "00:03:47", 1),
(33, "Ghetto Symphony (feat. C-Murder, Mystikal, Silkk the Shocker, Mia X, Fiend, Goldie Loc)", "00:01:59", 1),
(34, "Party With a D.P.G.", "00:02:25", 1),
(35, "Tu boca", "00:06:09", 3),
(36, "Waka Waka (This Time for Africa)", "00:04:14", 3),
(37, "Loca (feat. Dizzee Rascal)", "00:03:12", 3),
(38, "Buss\"n Rocks", "00:03:15", 1),
(39, "Just Dippin\" (feat. Dr. Dre, Jewell) (Produced By Dr. Dre)", "00:03:35", 1),
(40, "Don\"t Tell (feat. Warren G, Mausberg, Nate Dogg)", "00:01:36", 1),
(41, "20 Minutes (feat. Goldie Loc)", "00:07:06", 1),
(42, "I Love My Momma", "00:03:17", 1),
(43, "Rabiosa (feat. Pitbull)", "00:06:15", 3),
(44, "Waka Waka (Esto es África)", "00:01:27", 3);


CREATE TABLE IF NOT EXISTS concerti (
  concerto_id int(11) NOT NULL,
  artista_id int(11) NOT NULL,
  concerto_nome varchar(255) NOT NULL,
  concerto_data_ora datetime NOT NULL,
  concerto_location varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO concerti (concerto_id, artista_id, concerto_nome, concerto_data_ora, concerto_location) VALUES
(1, 2, "I Wanna Thank Me Tour", "2023-03-17 19:00:00", "Royal Arena København, Danimarca");


CREATE TABLE IF NOT EXISTS generi (
  genere_id int(11) NOT NULL,
  genere_nome varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO generi (genere_id, genere_nome) VALUES
(1, "Rock alternativo"),
(2, "Pop latino"),
(3, "Gangsta rap");


CREATE TABLE IF NOT EXISTS nazioni (
  nazione_id int(11) NOT NULL,
  nazione_nome varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO nazioni (nazione_id, nazione_nome) VALUES
(1, "Italia"),
(2, "Francia"),
(3, "Regno Unito"),
(4, "Stati Uniti");


CREATE TABLE IF NOT EXISTS releases (
  release_id int(11) NOT NULL,
  album_id int(11) NOT NULL,
  nazione_id int(11) NOT NULL,
  release_uscita date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO releases (release_id, album_id, nazione_id, release_uscita) VALUES
(1, 1, 4, "1999-05-11"),
(2, 1, 3, "1999-05-12"),
(3, 3, 4, "2010-10-15"),
(4, 3, 1, "2010-10-20"),
(5, 3, 2, "2010-10-19"),
(6, 3, 3, "2010-10-16"),
(7, 1, 2, "1999-05-15"),
(8, 2, 1, "2014-11-13"),
(9, 1, 1, "1999-05-16"),
(10, 2, 2, "2014-11-12"),
(11, 2, 3, "2014-11-13"),
(12, 2, 4, "2014-11-11");


ALTER TABLE albums
  ADD PRIMARY KEY (album_id),
  ADD KEY artista_id (artista_id);


ALTER TABLE albums_generi
  ADD PRIMARY KEY (album_id,genere_id),
  ADD KEY genere_id (genere_id);


ALTER TABLE artisti
  ADD PRIMARY KEY (artista_id);


ALTER TABLE brani
  ADD PRIMARY KEY (brano_id),
  ADD KEY album_id (album_id);


ALTER TABLE concerti
  ADD PRIMARY KEY (concerto_id),
  ADD KEY artista_id (artista_id);


ALTER TABLE generi
  ADD PRIMARY KEY (genere_id);


ALTER TABLE nazioni
  ADD PRIMARY KEY (nazione_id);


ALTER TABLE releases
  ADD PRIMARY KEY (release_id),
  ADD KEY album_id (album_id),
  ADD KEY nazione_id (nazione_id);


ALTER TABLE albums
  MODIFY album_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE artisti
  MODIFY artista_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE brani
  MODIFY brano_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;


ALTER TABLE concerti
  MODIFY concerto_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE generi
  MODIFY genere_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE nazioni
  MODIFY nazione_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE releases
  MODIFY release_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


ALTER TABLE albums
  ADD CONSTRAINT albums_ibfk_1 FOREIGN KEY (artista_id) REFERENCES artisti (artista_id);


ALTER TABLE albums_generi
  ADD CONSTRAINT albums_generi_ibfk_1 FOREIGN KEY (album_id) REFERENCES albums (album_id),
  ADD CONSTRAINT albums_generi_ibfk_2 FOREIGN KEY (genere_id) REFERENCES generi (genere_id);


ALTER TABLE brani
  ADD CONSTRAINT brani_ibfk_1 FOREIGN KEY (album_id) REFERENCES albums (album_id);


ALTER TABLE concerti
  ADD CONSTRAINT concerti_ibfk_1 FOREIGN KEY (artista_id) REFERENCES artisti (artista_id);


ALTER TABLE releases
  ADD CONSTRAINT releases_ibfk_1 FOREIGN KEY (album_id) REFERENCES albums (album_id),
  ADD CONSTRAINT releases_ibfk_2 FOREIGN KEY (nazione_id) REFERENCES nazioni (nazione_id);
COMMIT;
CREATE TABLE IF NOT EXISTS albums (
  album_id int(11) NOT NULL,
  album_nome varchar(255) NOT NULL,
  artista_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO albums (album_id, album_nome, artista_id) VALUES
(1, "No Limit Top Dogg", 2),
(2, "Sonic Highways", 1),
(3, "Sale el sol", 3);


CREATE TABLE IF NOT EXISTS albums_generi (
  album_id int(11) NOT NULL,
  genere_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO albums_generi (album_id, genere_id) VALUES
(1, 3),
(2, 1),
(3, 2);


CREATE TABLE IF NOT EXISTS artisti (
  artista_id int(11) NOT NULL,
  artista_name varchar(255) NOT NULL,
  artista_bio text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO artisti (artista_id, artista_name, artista_bio) VALUES
(1, "Foo Fighters", "I Foo Fighters sono un gruppo musicale rock alternativo statunitense fondato a Seattle nel 1994 dal musicista Dave Grohl, ex batterista dei Nirvana."),
(2, "Snoop Dogg", "Noto per il suo flow melodico, la sua musicalità ha permesso la diffusione del g-funk, in particolare in collaborazione con il collega Dr. Dre."),
(3, "Shakira", "Annoverata tra i principali esponenti del pop latino, ha debuttato nel mercato discografico latinoamericano nel 1991, dominandone la scena per oltre un decennio.");


CREATE TABLE IF NOT EXISTS brani (
  brano_id int(11) NOT NULL,
  brano_titolo varchar(255) NOT NULL,
  brano_durata time NOT NULL,
  album_id int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO brani (brano_id, brano_titolo, brano_durata, album_id) VALUES
(1, "Something from Nothing", "00:01:00", 2),
(2, "The Feast and the Famine", "00:08:13", 2),
(3, "Congregation", "00:04:22", 2),
(4, "What Did I Do?/God as My Witness", "00:02:42", 2),
(5, "Outside", "00:05:11", 2),
(6, "In the Clear", "00:04:14", 2),
(7, "Subterranean", "00:03:45", 2),
(8, "Dolomite", "00:02:09", 1),
(9, "I Am a River", "00:03:33", 2),
(10, "Buck \"Em (feat. Sticky Fingaz)", "00:05:10", 1),
(11, "Trust Me (feat. Suga Free, Sylk-E. Fyne)", "00:02:49", 1),
(12, "My Heat Goes Boom", "00:03:23", 1),
(13, "Dolomite (Interlude)", "00:05:01", 1),
(14, "Sale el sol", "00:00:00", 3),
(15, "Loca (feat. El Cata)", "00:04:21", 3),
(16, "Antes de las seis", "00:03:26", 3),
(17, "Snoopafella", "00:03:58", 1),
(18, "In Love With A Thug", "00:09:14", 1),
(19, "G Bedtime Stories", "00:02:14", 1),
(20, "Down 4 My Niggaz (feat. C-Murder, Magic)", "00:03:24", 1),
(21, "Gordita (feat. Residente dei Calle 13)", "00:03:22", 3),
(22, "Addicted to You", "00:03:35", 3),
(23, "Betta Days", "00:02:12", 1),
(24, "Lo que más", "00:06:16", 3),
(25, "Mariposas", "00:02:30", 3),
(26, "Rabiosa (feat. El Cata)", "00:10:24", 3),
(27, "Somethin\" Bout Yo Bidness (feat. Raphael Saadiq)", "00:03:32", 1),
(28, "Bitch Please (feat. Xzibit, Nate Dogg) (Produced By Dr. Dre)", "00:34:19", 1),
(29, "Devoción", "00:03:14", 3),
(30, "Islands", "00:07:03", 3),
(31, "Doin\" Too Much", "00:02:45", 1),
(32, "Gangsta Ride (feat. Silkk the Shocker)", "00:03:47", 1),
(33, "Ghetto Symphony (feat. C-Murder, Mystikal, Silkk the Shocker, Mia X, Fiend, Goldie Loc)", "00:01:59", 1),
(34, "Party With a D.P.G.", "00:02:25", 1),
(35, "Tu boca", "00:06:09", 3),
(36, "Waka Waka (This Time for Africa)", "00:04:14", 3),
(37, "Loca (feat. Dizzee Rascal)", "00:03:12", 3),
(38, "Buss\"n Rocks", "00:03:15", 1),
(39, "Just Dippin\" (feat. Dr. Dre, Jewell) (Produced By Dr. Dre)", "00:03:35", 1),
(40, "Don\"t Tell (feat. Warren G, Mausberg, Nate Dogg)", "00:01:36", 1),
(41, "20 Minutes (feat. Goldie Loc)", "00:07:06", 1),
(42, "I Love My Momma", "00:03:17", 1),
(43, "Rabiosa (feat. Pitbull)", "00:06:15", 3),
(44, "Waka Waka (Esto es África)", "00:01:27", 3);


CREATE TABLE IF NOT EXISTS concerti (
  concerto_id int(11) NOT NULL,
  artista_id int(11) NOT NULL,
  concerto_nome varchar(255) NOT NULL,
  concerto_data_ora datetime NOT NULL,
  concerto_location varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO concerti (concerto_id, artista_id, concerto_nome, concerto_data_ora, concerto_location) VALUES
(1, 2, "I Wanna Thank Me Tour", "2023-03-17 19:00:00", "Royal Arena København, Danimarca");


CREATE TABLE IF NOT EXISTS generi (
  genere_id int(11) NOT NULL,
  genere_nome varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO generi (genere_id, genere_nome) VALUES
(1, "Rock alternativo"),
(2, "Pop latino"),
(3, "Gangsta rap");


CREATE TABLE IF NOT EXISTS nazioni (
  nazione_id int(11) NOT NULL,
  nazione_nome varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO nazioni (nazione_id, nazione_nome) VALUES
(1, "Italia"),
(2, "Francia"),
(3, "Regno Unito"),
(4, "Stati Uniti");


CREATE TABLE IF NOT EXISTS releases (
  release_id int(11) NOT NULL,
  album_id int(11) NOT NULL,
  nazione_id int(11) NOT NULL,
  release_uscita date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO releases (release_id, album_id, nazione_id, release_uscita) VALUES
(1, 1, 4, "1999-05-11"),
(2, 1, 3, "1999-05-12"),
(3, 3, 4, "2010-10-15"),
(4, 3, 1, "2010-10-20"),
(5, 3, 2, "2010-10-19"),
(6, 3, 3, "2010-10-16"),
(7, 1, 2, "1999-05-15"),
(8, 2, 1, "2014-11-13"),
(9, 1, 1, "1999-05-16"),
(10, 2, 2, "2014-11-12"),
(11, 2, 3, "2014-11-13"),
(12, 2, 4, "2014-11-11");


ALTER TABLE albums
  ADD PRIMARY KEY (album_id),
  ADD KEY artista_id (artista_id);


ALTER TABLE albums_generi
  ADD PRIMARY KEY (album_id,genere_id),
  ADD KEY genere_id (genere_id);


ALTER TABLE artisti
  ADD PRIMARY KEY (artista_id);


ALTER TABLE brani
  ADD PRIMARY KEY (brano_id),
  ADD KEY album_id (album_id);


ALTER TABLE concerti
  ADD PRIMARY KEY (concerto_id),
  ADD KEY artista_id (artista_id);


ALTER TABLE generi
  ADD PRIMARY KEY (genere_id);


ALTER TABLE nazioni
  ADD PRIMARY KEY (nazione_id);


ALTER TABLE releases
  ADD PRIMARY KEY (release_id),
  ADD KEY album_id (album_id),
  ADD KEY nazione_id (nazione_id);


ALTER TABLE albums
  MODIFY album_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE artisti
  MODIFY artista_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE brani
  MODIFY brano_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;


ALTER TABLE concerti
  MODIFY concerto_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE generi
  MODIFY genere_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE nazioni
  MODIFY nazione_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE releases
  MODIFY release_id int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;


ALTER TABLE albums
  ADD CONSTRAINT albums_ibfk_1 FOREIGN KEY (artista_id) REFERENCES artisti (artista_id);


ALTER TABLE albums_generi
  ADD CONSTRAINT albums_generi_ibfk_1 FOREIGN KEY (album_id) REFERENCES albums (album_id),
  ADD CONSTRAINT albums_generi_ibfk_2 FOREIGN KEY (genere_id) REFERENCES generi (genere_id);


ALTER TABLE brani
  ADD CONSTRAINT brani_ibfk_1 FOREIGN KEY (album_id) REFERENCES albums (album_id);


ALTER TABLE concerti
  ADD CONSTRAINT concerti_ibfk_1 FOREIGN KEY (artista_id) REFERENCES artisti (artista_id);


ALTER TABLE releases
  ADD CONSTRAINT releases_ibfk_1 FOREIGN KEY (album_id) REFERENCES albums (album_id),
  ADD CONSTRAINT releases_ibfk_2 FOREIGN KEY (nazione_id) REFERENCES nazioni (nazione_id);
COMMIT;


select artista_name, artista_bio from artisti;


