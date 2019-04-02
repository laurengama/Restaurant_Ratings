# Restaurant_Reviews

Tahseen Chisti, Lauren Gama, Myke London

This group project combines restaurant reviews from multiple APIs and datasets to allow users access to restaurant ratings in one place.
________________________________________________________________________


When searching for restaurant ratings, users must typically search for the same restaurant on different websites to see how it is rated on each site. In order to simplify this process, our team decided to create a database of restaurant ratings. We wanted to create a database that would include ratings from multiple review sites so users could simply search for a restaurant once and find the information they need. In order to make this task more manageable, we limited our database to restaurants within the city of Pittsburgh, Pennsylvania (which was the only common city across our individual datasets).

Extract
We began by looking for review site data through Kaggle and APIs. Upon a thorough search, we found relevant datasets, provided by Yelp, Google, Yellowpages and Zomato, among others. We found a Yelp Dataset on Kaggle that had a few different JSON files. We downloaded the yelp_academic_dataset_business.json file because it had restaurant names, addresses, and ratings. We renamed the file to yelp_business.json and saved it to a local folder.

We also found a Yellowpages CSV on Kaggle with restaurant names, addresses, and ratings. We renamed the file to yellowpages.csv and saved it to a local folder. For time purposes, and the fact that Zomato’s API would only allow twenty results upon each request, we focused our first dataset on Kaggle’s Yellowpages dataset.  

We used the Google Places API to pull restaurant ratings from Google. This API requires geographic coordinates in order to obtain data for a specific city, therefore, we first used the Google Geocode API to find the coordinates for Pittsburgh, PA. Once we had the coordinates, we included them, as well as the radius for our search, “restaurant” as our location type, and the API key, as parameters for our Google Places API call. This returned our data in a JSON format.

Transform
The Yelp JSON file was in a unorthodox format in where the records were not separated by commas. Hence we had to enter the below code to get the data in a pandas readable format.

 

Once this was complete, we created a new dataframe with only the following columns: name, categories, address, city, state, postal_code, and stars. We then used the loc function to limit the dataframe to only businesses in Pittsburgh. Then, as the dataset had information for different types of businesses, we used the loc function to filter out the restaurants. Finally, we had to encode the name column of the dataframe in order to be able to export it into SQL.

 

To manipulate our Yellowpages CSV data, the file needed to be first saved to a local folder.  Once saved, we connected the raw Yellowpages CSV data and saved the data into a pandas dataframe within a Jupyter Notebook.  With the CSV file now converted to a pandas dataframe, we included only restaurants found in Pittsburgh, PA by using the loc function.  Next, we removed all unnecessary columns to include only the restaurants name, street, city, state and rating and renamed the columns Restaurant_YP, Address, City_YP, State_YP and Rating_YP.      

The next step with the Google Places data was to store it in a pandas data frame. This was done by creating empty lists for restaurant name, address, and rating, and then looping through the JSON data to append name, vicinity, and rating to these lists, respectively. These three lists were then used to create the data frame. In order to more closely match the data retrieved for other websites, these columns were renamed to Restaurant_G, Address_G, and Rating_G. Also, Pittsburgh was dropped from the Address_G column by splitting the address at the comma. 

Load
With our Yelp JSON dataset, Yellowpages CSV dataset and Google JSON dataset now converted into their respective pandas dataframes within a Jupyter Notebook, we needed to combine all three pandas dataframes into one common dataset.  To do so, we first attempted to combine the datasets with a common identifier by using the pandas merge function inside a Jupyter Notebook.  After some time, we pivoted our course of action upon realizing this task would be easier using SQL, rather than pandas.  Once we shifted strategies, we converted each pandas dataframe into SQL using the bellow code.

       

Next, we created a new SQL database, entitled restaurant_db.  Once the SQL database was created, we selected from our yelp_reviews table, and used a left outer join to combine with our yellowpages table and our google table.  We then grouped these tables on name.  The steps can be seen using the following SQL code.

 
 
 

Our team set out to create a database that would allow users to see restaurant ratings from mulitple websites at once. We encoutered challenges with finding a common city across each of our datasets as well as being limited to only 20 restaurants from the Google Places API call. However, we were able to pull together a database that contains ratings for some of the same restaurants so users can see ratings from our three sources in one place.
