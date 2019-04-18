# Restaurant Ratings

Lauren Gama, Tahseen Chisti, Myke London

## Summary

#### Description
Our data science group project combines restaurant ratings from multiple APIs and datasets to allow users access to restaurant ratings from different sources in one place.

#### Motivation
When searching for restaurant ratings, users must typically search for the same restaurant on different websites to see how it is rated on each site. In order to simplify this process, our team decided to create a database of restaurant ratings. We wanted to create a database that would include ratings from multiple review sites so users could simply search for a restaurant once and find all the information they needed.

#### Result
Using a Yelp [dataset](INSERT KAGGLE LINK), Yellowpages [dataset]( INSERT KAGGLE LINK), the Google Geocode API, and the Google Places API, we were able to gather Pittsburgh restaurant rating data into MySQL.

#### Team Efforts
Taz was responsible for manipulating the Yelp dataset and loading all our data into MySQL. Myke was responsible for manipulating the Yellowpages dataset. I was responsible for acquiring and cleaning the Google Places API data.

#### Individual Responsibilities
* Perform Google Geocode API call to find the coordinates for Pittsburgh, PA.
* Perform Google Places API call using parameters including the above coordinates, the radius for our search, and “restaurant” as our location type.
* Transform the returned JSON data into a pandas data frame by creating empty lists for restaurant name, address, and rating, and then looping through the JSON data to append name, vicinity, and rating to these lists, respectively.
* Rename columns to Restaurant_G, Address_G, and Rating_G.
* Drop Pittsburgh from the Address_G column by splitting the address at the comma.

#### Challenges
As a team, we ran into multiple challenges along the way. One of the main issues was scaling back our initial goal for the project. We originally wanted to create a database that would include all the restaurants in Jersey City, but when we found that the Yelp and Yellowpages datasets did not include Jersey City, we had to use a common city across the three datasets: Pittsburgh, PA. Furthermore, in order to avoid paying for our API calls, we were limited to a dataset of only 20 restaurants from the Google Places API. Luckily, we were still able to find a restaurant in common across the datasets.

#### Improvements
With more time (and resources), we would like to expand our database to include more restaurants in Pittsburgh, perhaps more cities, and more data beyond ratings. We would like to use more API data as opposed to potentially outdated Kaggle files. Lastly, we would like to spend more time in MySQL, testing the ease with which we can pull ratings from our database.

