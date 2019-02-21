create database restaurant_db;
use restaurant_db;

select*from yelp_reviews
left outer join yp_reviews on yelp_reviews.address = yp_reviews.address
left outer join google_reviews on yelp_reviews.address = google_reviews.address;

