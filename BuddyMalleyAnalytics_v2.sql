/*
Buddy & Malley TikTok Analytics Database
SQL Server / SSMS Script

Starter database based on the TikTok analytics screenshots.
*/

IF DB_ID('BuddyMalleyAnalytics') IS NOT NULL
BEGIN
    ALTER DATABASE BuddyMalleyAnalytics SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE BuddyMalleyAnalytics;
END;
GO

CREATE DATABASE BuddyMalleyAnalytics;
GO

USE BuddyMalleyAnalytics;
GO

CREATE TABLE dbo.Videos
(
    video_id INT IDENTITY(1,1) PRIMARY KEY,
    platform VARCHAR(25) NOT NULL,
    posted_date DATE NULL,
    video_title VARCHAR(300) NOT NULL,
    content_type VARCHAR(50) NULL,
    story_arc VARCHAR(100) NULL,
    video_length_seconds INT NULL,
    views INT NULL,
    likes INT NULL,
    comments INT NULL,
    shares INT NULL,
    saves INT NULL,
    total_play_time_seconds INT NULL,
    average_watch_time_seconds DECIMAL(10,2) NULL,
    watched_full_video_percent DECIMAL(5,2) NULL,
    new_followers INT NULL
);
GO

CREATE TABLE dbo.TrafficSources
(
    traffic_source_id INT IDENTITY(1,1) PRIMARY KEY,
    video_id INT NOT NULL,
    source_name VARCHAR(100) NOT NULL,
    source_percent DECIMAL(5,2) NOT NULL,
    CONSTRAINT FK_TrafficSources_Videos
        FOREIGN KEY (video_id) REFERENCES dbo.Videos(video_id)
);
GO

CREATE TABLE dbo.SearchQueries
(
    search_query_id INT IDENTITY(1,1) PRIMARY KEY,
    video_id INT NOT NULL,
    search_query VARCHAR(200) NOT NULL,
    query_percent DECIMAL(5,2) NOT NULL,
    CONSTRAINT FK_SearchQueries_Videos
        FOREIGN KEY (video_id) REFERENCES dbo.Videos(video_id)
);
GO

INSERT INTO dbo.Videos
(
    platform, posted_date, video_title, content_type, story_arc, video_length_seconds,
    views, likes, comments, shares, saves, total_play_time_seconds,
    average_watch_time_seconds, watched_full_video_percent, new_followers
)
VALUES
('TikTok', '2026-05-15', 'The letter said they were chosen... and now Buddy & Malley have officially arrived', 'Episode', 'Space Center Arrival', 20, 138, 3, 0, 0, 0, 854, 5.69, 8.70, 0),
('TikTok', '2026-05-18', 'Buddy Malley Episode 4 - Astronaut training is exhausting...', 'Episode', 'Training', 23, 152, 3, 0, 0, 0, 1202, 7.37, 12.30, 0),
('TikTok', '2026-05-21', 'Buddy Malley Episode 5 - The Race Buddy thought winning was everything...', 'Episode', 'Race', 27, 163, 1, 0, 0, 0, 1250, 7.49, 7.80, 0),
('TikTok', '2026-05-26', 'The night before the big race... Malley relaxes by sleeping. Buddy relaxes...', 'Short', 'Race Prep / Sleeping', 5, 1064, 34, 0, 0, 0, 4446, 4.18, 32.30, 0),
('TikTok', '2026-05-26', 'Race day routine: hydrate first...', 'Short', 'Race Prep / Hydration', 5, 844, 7, 0, 1, 0, 3526, 4.15, 29.50, 0),
('TikTok', '2026-05-27', 'Buddy crashes... Malley: Get up. We are finishing this race.', 'Short', 'Race / Crash', 13, 1000, 26, 0, 0, 0, 7887, 7.87, 27.50, 0),
('TikTok', '2026-05-27', 'Buddy reacts. Malley solves the problem. Mail Truck!', 'Short', 'Mail Truck', 9, 740, 32, 0, 0, 1, 3828, 5.22, 19.60, 1),
('TikTok', '2026-05-28', 'Some adventures are better with your best friend.', 'Short', 'Friendship', 10, 361, 14, 0, 0, 0, 1344, 3.71, 14.10, 0),
('TikTok', '2026-05-28', 'Buddy and Malley training was going fine... until gravity stopped working.', 'Short', 'Anti-Gravity', 6, 721, 11, 0, 0, 0, 2746, 3.80, 24.50, 0),
('TikTok', '2026-05-31', 'Coming back from the Big Race, Buddy spotted the Anti-Gravity Room.', 'Short', 'Anti-Gravity', 27, 294, 5, 1, 0, 0, 2370, 8.01, 9.80, 0),
('TikTok', '2026-06-01', 'Buddy and Malley thought fetch would be easy in zero gravity.', 'Short', 'Anti-Gravity Fetch', 14, 328, 3, 0, 0, 0, 2450, 7.43, 24.60, 0);
GO

INSERT INTO dbo.TrafficSources (video_id, source_name, source_percent) VALUES
(1, 'For You', 80.70),(1, 'Personal profile', 10.00),(1, 'Other', 6.00),(1, 'Search', 3.30),(1, 'Sound', 0.10),(1, 'Following', 0.10),
(2, 'For You', 81.00),(2, 'Personal profile', 11.70),(2, 'Other', 6.10),(2, 'Search', 1.20),(2, 'Following', 0.10),(2, 'Sound', 0.10),
(3, 'For You', 79.00),(3, 'Personal profile', 12.60),(3, 'Search', 4.80),(3, 'Other', 3.60),(3, 'Following', 0.10),(3, 'Sound', 0.10),
(4, 'For You', 97.70),(4, 'Personal profile', 2.00),(4, 'Search', 0.20),(4, 'Other', 0.10),(4, 'Following', 0.10),(4, 'Direct messages', 0.10),(4, 'Sound', 0.10),
(5, 'For You', 96.50),(5, 'Personal profile', 2.60),(5, 'Other', 0.50),(5, 'Search', 0.40),(5, 'Following', 0.10),(5, 'Direct messages', 0.10),(5, 'Sound', 0.10),
(6, 'For You', 96.80),(6, 'Personal profile', 2.40),(6, 'Search', 0.70),(6, 'Other', 0.10),(6, 'Following', 0.10),(6, 'Direct messages', 0.10),(6, 'Sound', 0.10),
(7, 'For You', 97.10),(7, 'Personal profile', 2.30),(7, 'Search', 0.30),(7, 'Other', 0.30),(7, 'Following', 0.10),(7, 'Direct messages', 0.10),(7, 'Sound', 0.10),
(8, 'For You', 95.30),(8, 'Personal profile', 3.60),(8, 'Search', 0.80),(8, 'Other', 0.30),(8, 'Following', 0.10),(8, 'Direct messages', 0.10),(8, 'Sound', 0.10),
(9, 'For You', 97.60),(9, 'Personal profile', 1.50),(9, 'Search', 0.60),(9, 'Other', 0.30),(9, 'Following', 0.10),(9, 'Direct messages', 0.10),(9, 'Sound', 0.10),
(10, 'For You', 99.40),(10, 'Personal profile', 0.30),(10, 'Other', 0.30),(10, 'Following', 0.10),(10, 'Direct messages', 0.10),(10, 'Sound', 0.10),(10, 'Search', 0.10),
(11, 'For You', 100.00),(11, 'Following', 0.10),(11, 'Direct messages', 0.10),(11, 'Personal profile', 0.10),(11, 'Sound', 0.10),(11, 'Search', 0.10),(11, 'Other', 0.10);
GO

INSERT INTO dbo.SearchQueries (video_id, search_query, query_percent) VALUES
(1, 'buddymalleyplayco', 80.00),
(1, 'astronaut dog', 20.00),
(2, 'buddymalleyplayco', 50.00),
(2, 'space buddies dogs animation', 50.00),
(3, 'buddymalleyplayco', 28.60),
(3, 'dog racing animation', 14.30),
(3, 'Racing dog comic', 14.30),
(3, 'dog racing animation drag path', 14.30),
(3, 'dog race episode', 14.30),
(4, 'buddymalleyplayco', 100.00),
(5, 'buddymalleyplayco', 66.70),
(5, 'hydrate or diedrate funny', 33.30),
(6, 'buddymalleyplayco', 57.10),
(6, 'crash dog name', 14.30),
(6, 'race dog crashes', 14.30),
(6, 'Buddy the dog crash scene', 14.30),
(7, 'buddymalleyplayco', 100.00),
(8, 'buddymalleyplayco', 100.00),
(9, 'buddymalleyplayco', 80.00);
GO
