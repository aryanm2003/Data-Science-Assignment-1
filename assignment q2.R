tennis <- function(p) {
  # Initialize the number of sets played
  x <- 0
  
  # Simulate the tennis match
  while (x < 5) {
    # Simulate a set with probability p
    set_winner <- sample(c("A", "B"), 1, prob = c(p, 1 - p))
    
    # Increment the number of sets played
    x <- x + 1
    
    # Check if the match is already won by a player
    if (x >= 3 && set_winner != "A" && set_winner != "B") {
      break
    }
  }
  
  # Return the number of sets played
  return(x)
}
# Define the probability of player A winning a set
p <- 0.70

# Create an empty vector to store the number of sets played in each match
matches <- numeric(1000)

# Repeat the simulation 1000 times
for (i in 1:1000) {
  # Simulate a tennis match and store the number of sets played in 'matches'
  matches[i] <- tennis(p)
}

# Calculate the average number of matches
ans <- mean(matches)

# Print the average number of matches
print(ans)


