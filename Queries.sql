CREATE DATABASE restaurant_db;
USE restaurant_db;


SELECT * FROM yelp_reviews;
 
SELECT * FROM yp_reviews;

SELECT * FROM google_reviews;


-- restaurants with ratings of 5
SELECT Restaurant_Y, Rating_Y 
FROM yelp_reviews 
WHERE Rating_Y = 5 
ORDER BY Restaurant_Y;


SELECT Restaurant_YP, Rating_YP 
FROM yp_reviews 
WHERE Rating_YP = 5 
ORDER BY Restaurant_YP;


SELECT Restaurant_G, Rating_G 
FROM google_reviews 
WHERE Rating_G = 5 
ORDER BY Restaurant_G;


-- number of restaurants rated 4 and above
SELECT COUNT(Restaurant_Y) 
FROM yelp_reviews 
WHERE Rating_Y >= 4;


SELECT COUNT(Restaurant_YP) 
FROM yp_reviews 
WHERE Rating_YP >= 4;


SELECT COUNT(Restaurant_G) 
FROM google_reviews 
WHERE Rating_G >= 4;


-- number of Italian restaurants
SELECT COUNT(Restaurant_Y) 
FROM yelp_reviews 
WHERE Categories_Y LIKE '%Italian%';

-- average rating of seafood restaurants
SELECT ROUND(AVG(Rating_Y), 2)
FROM yelp_reviews 
WHERE Categories_Y LIKE '%Seafood%';


-- matches (Yelp & YellowPages)
SELECT Restaurant_Y, Categories_Y, Rating_Y, Rating_YP
FROM yelp_reviews
JOIN yp_reviews ON yelp_reviews.Address_Y = yp_reviews.Address_YP
ORDER BY Restaurant_Y;


-- 1 match (Yelp & Google)
SELECT Restaurant_Y, Categories_Y, Rating_Y, Rating_G
FROM yelp_reviews
JOIN google_reviews ON yelp_reviews.Address_Y = google_reviews.Address_G;

-- no matches (YellowPages & Google)
SELECT Restaurant_YP, Rating_YP, Rating_G
FROM yp_reviews
JOIN google_reviews ON yp_reviews.Address_YP = google_reviews.Address_G;



