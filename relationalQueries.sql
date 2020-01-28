/* 1 Table */
SELECT DISTINCT Song_name FROM Songs WHERE Genre = 'Rap';

SELECT DISTINCT Song_name FROM Songs WHERE Number_of_plays > 100000000;
/* 2 Table */
SELECT DISTINCT Charts.Chart_title, C_type FROM Charts, Chart_type WHERE Charts.Chart_title = Chart_type.Chart_title; 

SELECT DISTINCT Artist_name FROM Concert_tickets, Artists WHERE Offered_by = Artist_name; 

SELECT DISTINCT Creator FROM Podcast, Podcast_eps WHERE Release_date > '01-NOV-19';
/* 3 Table */
SELECT DISTINCT Podcast.Podcast_name, Podcast_eps.Episode_title FROM Podcast, Podcast_eps, Top_podcast WHERE Top_podcast.Podcast_name = Podcast.Podcast_name AND Podcast.Podcast_name = Podcast_eps.Podcast_name; 

SELECT DISTINCT Artists.Artist_name, Songs.Song_name FROM Songs, Performed_by, Artists WHERE Songs.Song_name = Performed_by.Song_name AND Performed_by.Artist_name = Artists.Artist_name;

SELECT DISTINCT Song_name, C_type FROM Chart_type a, Song_charts b, Charts c WHERE b.Chart_title = c.Chart_title AND c.Chart_title = a.Chart_title;
/* 4 Table */
SELECT DISTINCT Record_label, Album_name FROM Artists a, Songs s, Album_songs b, Performed_by p WHERE a.Artist_name = p.Artist_name AND p.Song_name = s.Song_name AND s.Song_name = b.Song_name;

SELECT DISTINCT Albums.Album_name, Artists.Artist_name, Concert_tickets.C_date FROM Concert_tickets, Artists, Artist_creates, Albums WHERE Concert_tickets.Offered_by = Artists.Artist_name AND Artists.Artist_name = Artist_creates.Artist_name AND Artist_creates.Album_name = Albums.Album_name;