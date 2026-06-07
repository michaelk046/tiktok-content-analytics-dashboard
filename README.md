# TikTok Content Analytics Dashboard

## What This Project Is

This project started as a way to better understand what was actually happening on the Buddy & Malley TikTok channel.

TikTok gives you a lot of numbers, but they are spread across different screens and it can be difficult to see patterns. I wanted a way to pull everything together into one place and answer questions like:

* Which videos are getting the most views?
* Which videos are keeping people watching?
* Which videos are getting people to interact?
* Are certain types of content performing better than others?

To answer those questions, I built a SQL Server database and a Power BI dashboard using data collected from TikTok analytics.

---

## Tools Used

* SQL Server
* Power BI
* DAX
* TikTok Analytics

---

## Database Design

The data is organized into three main tables:

### Videos

Stores information about each video including:

* Views
* Likes
* Comments
* Shares
* Saves
* Average Watch Time
* Completion Rate

### Traffic Sources

Stores where viewers found the video.

Examples include:

* For You Page
* Search
* Personal Profile
* Following

### Search Queries

Stores search terms that TikTok reported for each video.

---

## Dashboard Pages

### Page 1 - Video Performance

This page focuses on overall performance.

It includes:

* Total Views
* Total Likes
* Average Watch Time
* Average Completion Rate
* Views by Video
* Likes by Video
* Completion Rate by Video
* Average Watch Time by Video

The goal is to quickly identify which videos performed best.

### Page 2 - Content Insights

This page focuses on understanding why certain videos performed better than others.

It includes:

* Engagement Rate by Video
* Story Arc Performance
* Key Findings
* Recommendations

Instead of looking at individual videos, this page looks for patterns across content themes.

---

## What I Found

A few things stood out almost immediately.

Race-related content consistently generated the highest view counts.

Videos focused on friendship and emotional moments generated some of the strongest engagement rates even when total views were lower.

The anti-gravity videos generated solid reach but did not create the same level of engagement as some of the other story arcs.

One of the biggest takeaways was that views and engagement do not always tell the same story. Some videos attracted a large audience while others created a stronger connection with viewers.

---

## Repository Contents

### /sql

Database creation scripts.

### /powerbi

Power BI dashboard files.

### /images

Dashboard screenshots.

---

## Why I Built It

Part of my goal is moving toward Data Analyst roles, and I wanted a project built from real data rather than a sample dataset.

This project gave me the opportunity to work through the entire process:

* Designing the database
* Loading and organizing data
* Building relationships
* Creating DAX measures
* Designing dashboards
* Analyzing results
* Making recommendations based on the data

In other words, not just building charts, but actually using the data to answer questions.
