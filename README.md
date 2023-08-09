# Instagram Clone - MySQL Project

## Description

This project is an Instagram database clone implemented using MySQL. It involves designing and populating a database to simulate a social media platform's functionalities, such as user profiles, photo uploads, likes, comments, and more. The project also includes data analysis tasks using SQL queries to gain insights into user behavior and engagement.

## Table of Contents

- [Entities](#entities)
- [Schema](#schema)
- [Challenges](#challenges)
- [Data Analysis](#data-analysis)

## Entities

The project focuses on the following main entities:

1. **Users:** Store user information, including username and registration date.
2. **Photos:** Store photo details, including the image URL, user who uploaded it, and upload date.
3. **Comments:** Store user comments associated with specific photos.
4. **Likes:** Store user likes on photos.
5. **Follows:** Store user-follow relationships.
6. **Tags:** Store tag names for categorizing photos.
7. **Photo_Tags:** Associate tags with specific photos.

## Schema

The database schema consists of several tables as described above. Here's a brief overview:

- Users
- Photos
- Comments
- Likes
- Follows
- Tags
- Photo_Tags

Each table is designed to capture specific aspects of the Instagram-like platform and allows for querying and analyzing user interactions.

## Challenges

Throughout the project, I tackled various challenges to understand user behavior and engagement:

1. Identifying the oldest users on the platform.
2. Identifying inactive users who have never posted photos.
3. Determining the user with the most likes on a single photo.
4. Calculating the average number of photos posted per user.
5. Finding the most commonly used hashtags.

## Data Analysis

The project includes several SQL queries to analyze user engagement and behavior:

1. Query to find the oldest users.
2. Query to find users who have never posted photos.
3. Query to identify the user with the most likes on a single photo.
4. Query to calculate the average number of photos posted per user.
5. Query to identify the top 5 most commonly used hashtags.

## Usage

To use or contribute to this project, follow these steps:

1. Clone the repository: `git clone https://github.com/yourusername/instagram-clone-mysql.git`
2. Set up your MySQL database and configure the connection details.
3. Execute the SQL script to create the database schema and populate sample data.
4. Run the provided SQL queries to perform data analysis tasks.

## Conclusion

This project offers insights into designing a social media database and using SQL queries for data analysis. It showcases my skills in database design, SQL query writing, and data analysis techniques in a data science context.

Feel free to reach out if you have questions or suggestions for improvement!


