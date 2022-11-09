#Instagram Database Clone
#First of all, you need to observe what's your entities 
#1-) users
#2-) image(s)
#3-) likes
#4-) hashtags
#5-) comments
#6-) followers/following)

CREATE DATABASE instagram_clone
USE instagram_clone

#Users
CREATE TABLE users
(
      id INT PRIMARY KEY AUTO_INCREMENT,
      username VARCHAR(255) UNIQUE NOT NULL,
      created_at TIMESTAMP DEFAULT NOW()
)
DESC users

#Photos
CREATE TABLE photo
(
      id INT PRIMARY KEY AUTO_INCREMENT,
      image_url VARCHAR(255) NOT NULL,
      user_id INT NOT NULL,
      created_at TIMESTAMP DEFAULT NOW(),
      FOREIGN KEY(user_id) REFERENCES users(id)
)

#Comments
CREATE TABLE comments
(
      id INT PRIMARY KEY AUTO_INCREMENT,
      comment_text VARCHAR(255) NOT NULL,
      created_at TIMESTAMP DEFAULT NOW(),
      user_id INT NOT NULL,
      photo_id INT NOT NULL,
      FOREIGN KEY(user_id) REFERENCES users(id),
      FOREIGN KEY(photo_id) REFERENCES photo(id)
)

#Likes
CREATE TABLE likes
(
      created_at TIMESTAMP DEFAULT NOW(),
      photo_id INT NOT NULL,
      user_id INT NOT NULL,
      FOREIGN KEY(photo_id) REFERENCES photo(id),
      FOREIGN KEY(user_id) REFERENCES users(id),
      PRIMARY KEY(photo_id,user_id)             #This code is blocking any looping
)
ALTER TABLE photo RENAME TO photos #Oops!

#Follows
CREATE TABLE follows
(
      follower_id INT NOT NULL,
      followee_id INT NOT NULL,
      created_at TIMESTAMP DEFAULT NOW(),
      FOREIGN KEY(follower_id) REFERENCES users(id),
      FOREIGN KEY(followee_id) REFERENCES users(id),
      PRIMARY KEY(follower_id,followee_id)
)

#Tags -> There are three stuctures potential(VARCHAR,Tags table,Tags and Photo_tags table)
CREATE TABLE tags
(
      id INTEGER AUTO_INCREMENT PRIMARY KEY,
      tag_name VARCHAR(255) UNIQUE,
      created_at TIMESTAMP DEFAULT NOW()
)

CREATE TABLE photo_tags
(
      photo_id INT NOT NULL,
      tag_id INT NOT NULL,
      FOREIGN KEY(photo_id) REFERENCES photos(id),
      FOREIGN KEY(tag_id) REFERENCES tags(id),
      PRIMARY KEY(photo_id,tag_id)

)

#Working With Lots Of Instagram Data
SHOW TABLES
#Challenge 1: We want to reward our users who have been around the longest. Find the 5 olders users
SELECT username,
       created_at AS oldest_users 
FROM users
ORDER BY created_at ASC
LIMIT 5

#Challenge 2: We want to target our inactive users with an email campaign. Find the users who have never posted a photo
SELECT username,
      image_url AS never_posted 
FROM users
LEFT JOIN photos
      ON users.id = photos.user_id
WHERE photos.image_url IS NULL
GROUP BY users.id

#Challenge 3: We are running a new contest to see who can get the most likes on a single photo? Who won.

SELECT 
      username,
      photos.id,
      photos.image_url,
      COUNT(*) AS total
FROM photos
INNER JOIN likes 
      ON likes.photo_id = photos.id
INNER JOIN users
      ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1

#Challenge 4: Our investors want to know... How many times does the average user post?
SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg_

#Challenge 5: A brand wants to know hashtags to use in a post. What are the top 5 most commonly used hashtags?
SELECT tag_name
FROM tags
INNER JOIN photo_tags
      ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY tag_id DESC
LIMIT 5

# Challenge 6: Finding bots. users who have liked every single photo

SELECT username, COUNT(*) AS num_likes
FROM users
INNER JOIN likes
      ON users_id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = 257


