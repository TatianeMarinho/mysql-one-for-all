CREATE TABLE SpotifyClone.favorites_songs(
	user_id INT NOT NULL,
    song_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
)ENGINE=InnoDB;

INSERT INTO favorites_songs(user_id, song_id)
VALUES
	(1, 10),
    (1, 2),
    (1, 3),
    (2, 8),
    (3, 7),
    (3, 10),
    (4, 4),
    (4, 8),
    (5, 3),
    (5, 5),
    (8, 8),
    (9, 4),
    (10, 10);
