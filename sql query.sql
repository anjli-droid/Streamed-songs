create database songs;
use songs;

SELECT
    d.song_id,
    d.track_name,
    d.artist,
    d.album_name,
    d.release_date,
    d.isrc,
    m.all_time_rank,
    m.track_score,
    m.spotify_streams,
    m.spotify_playlist_count,
    m.spotify_playlist_reach,
    m.spotify_popularity,
    m.youtube_views,
    m.youtube_likes,
    m.apple_music_playlist_count
FROM songs_dim d
INNER JOIN song_metrics m
    ON d.song_id = m.song_id;
    
SELECT
    d.track_name,
    d.artist,
    m.spotify_streams
FROM songs_dim d
JOIN song_metrics m
    ON d.song_id = m.song_id
ORDER BY m.spotify_streams DESC
LIMIT 30;

SELECT
    d.artist,
    COUNT(*) AS total_songs
FROM songs_dim d
GROUP BY d.artist
ORDER BY total_songs DESC;
