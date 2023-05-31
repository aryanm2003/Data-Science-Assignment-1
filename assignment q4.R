# Install and load the required packages
install.packages("rvest")
library(rvest)

# Define the URL of the webpagehttps
url <- "https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/"

# Read the HTML content of the webpage
webpage <- read_html(url)

# Extract the ranking, movie name, tomato score, and year of movie
ranking <- html_text(html_nodes(webpage, ".countdown-index"))
movie_name <- html_text(html_nodes(webpage, ".article_movie_title"))
tomato_score <- html_text(html_nodes(webpage, ".tMeterScore"))
year <- html_text(html_nodes(webpage, ".start-year"))

# Create a data frame for the extracted information
movie_data <- data.frame(
  Ranking = ranking,
  Movie = movie_name,
  Tomato_Score = tomato_score,
  Year = year
)

# Print the movie data
print(movie_data)
