DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `subscription` (
	subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    subscription_type VARCHAR(50) NOT NULL,
    price DECIMAL(5,2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `users`(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `age` TINYINT UNSIGNED CHECK (`age` > 0 AND `age` < 100),
    `date_subscription` DATE NOT NULL,
    subscription_id INT,
    FOREIGN KEY (subscription_id) REFERENCES `subscription` (subscription_id)
) ENGINE=InnoDB;

CREATE TABLE artistes (
	artiste_id INT PRIMARY KEY AUTO_INCREMENT,
    artiste VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE albums (
	album_id INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    artiste_id INT NOT NULL,
    release_year YEAR NOT NULL,
    FOREIGN KEY (artiste_id) REFERENCES artistes (artiste_id)
) ENGINE=InnoDB;

CREATE TABLE songs (
	song_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,
    length_second INT NOT NULL,
	FOREIGN KEY (album_id) REFERENCES albums (album_id)
) ENGINE=InnoDB;

CREATE TABLE historic (
	`date` DATETIME NOT NULL,
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (`date`, user_id),
    FOREIGN KEY (user_id) REFERENCES `users` (user_id),
    FOREIGN KEY (song_id) REFERENCES songs (song_id)
) ENGINE=InnoDB;

CREATE TABLE followed (
    artiste_id INT NOT NULL,
    user_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(artiste_id, user_id), 
    FOREIGN KEY (artiste_id) REFERENCES artistes (artiste_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.subscription (subscription_type, price) VALUES
	('gratuito', 0.00),
	('familiar', 7.99),
	('universitario', 5.99),
	('pessoal', 6.99);

INSERT INTO SpotifyClone.users (name, age, date_subscription, subscription_id) VALUES
	('Barbara Liskov', 82, '2019-10-20', 1),
	('Robert Cecil Martin', 58, '2017-01-06', 1),
	('Ada Lovelace', 37, '2017-12-30', 2),
	('Martin Fowler', 46, '2017-01-17', 2),
	('Sandi Metz', 58, '2018-04-29', 2),
	('Paulo Freire', 19, '2018-02-14', 3),
	('Bell Hooks', 26, '2018-01-05', 3),
	('Christopher Alexander', 85, '2019-06-05', 4),
	('Judith Butler', 45, '2020-05-13', 4),
	('Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO SpotifyClone.artistes (artiste) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

INSERT INTO SpotifyClone.albums (title, artiste_id, release_year) VALUES
	('Renaissance', '1', '2022'),
	('Jazz', '2', '1978'),
	('Hot Space', '2', '1982'),
	('Falso Brilhante', '3', '1998'),
	('Vento de Maio', '3', '2001'),
	('QVVJFA?', '4', '2003'),
	('Somewhere Far Beyond', '5', '2007'),
	('I Put A Spell On You', '6', '2012');

INSERT INTO SpotifyClone.followed (artiste_id, user_id) VALUES
	('1', '1'),
	('1', '2'),
	('1', '6'),
	('2', '3'),
	('2', '10'),
	('3', '1'),
	('3', '2'),
	('3', '9'),
	('4', '4'),
	('5', '5'),
	('6', '6'),
	('6', '5'),
	('6', '7'),
	('2', '1');

INSERT INTO SpotifyClone.songs (title, album_id, length_second) VALUES
	('Samba em Paris', '6', '267'),
	('Como Nossos Pais', '4', '105'),
	('Feeling Good', '8', '100'),
	('O Medo de Amar é o Medo de Ser Livre', '5', '207'),
	('Virgo\’s Groove', '1', '369'),
	('Under Pressure', '3', '152'),
	('Break my Soul', '1', '279'),
	('Don\'t Stop Me Now', '2', '203'),
	('The Bard\'s Song', '7', '244'),
	('Alien Superstar', '1', '116');

INSERT INTO SpotifyClone.historic (`date`, user_id, song_id) VALUES
	('2011-12-15 22:30:49', '7', '8'),
	('2012-03-17 14:56:41', '8', '8'),
	('2015-12-13 08:30:22', '10', '10'),
	('2017-01-24 00:31:17', '6', '4'),
	('2017-10-12 12:35:20', '6', '7'),
	('2020-01-02 07:40:33', '2', '4'),
	('2020-03-06 11:22:33', '1', '3'),
	('2020-05-02 05:30:35', '1', '5'),
	('2020-08-06 15:23:43', '5', '6'),
	('2020-11-13 16:55:13', '3', '3'),
	('2020-12-05 18:38:30', '3', '5'),
	('2021-08-15 17:10:10', '4', '1'),
	('2022-01-09 01:44:33', '5', '1'),
	('2022-02-24 21:14:22', '9', '9'),
	('2022-02-28 10:45:55', '1', '1'),
	('2022-08-05 08:05:17', '2', '3');

