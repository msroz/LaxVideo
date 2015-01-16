CREATE TABLE IF NOT EXISTS videos (
    id           INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    status       TINYINT UNSIGNED NOT NULL,
    video_id     VARCHAR(255) NOT NULL,
    title        VARCHAR(255) NOT NULL,
    description  TEXT NOT NULL,
    link         VARCHAR(255) NOT NULL,
    uri          VARCHAR(255) NOT NULL,
    width        INTEGER UNSIGNED NOT NULL,
    height       INTEGER UNSIGNED NOT NULL,
    picture      VARCHAR(255) NOT NULL,
    duration     INTEGER UNSIGNED NOT NULL,
    score        INTEGER UNSIGNED NOT NULL,
    `like`       INTEGER UNSIGNED NOT NULL,
    dislike      INTEGER UNSIGNED NOT NULL,
    created_at   INTEGER UNSIGNED NOT NULL,
    updated_at   INTEGER UNSIGNED NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
