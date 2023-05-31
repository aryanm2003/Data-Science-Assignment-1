MontyHall <- function() {
  # Generate the true location of the car (1, 2, or 3)
  car <- sample(1:3, 1)
  
  # Generate the initial choice of the contestant (1, 2, or 3)
  initial_choice <- sample(1:3, 1)
  
  # Determine the door that Monty opens
  monty_open <- sample(setdiff(1:3, c(initial_choice, car)), 1)
  
  # Determine the door to switch to
  switch_choice <- setdiff(1:3, c(initial_choice, monty_open))
  
  # Determine if the contestant wins
  win <- ifelse(switch_choice == car, 1, 0)
  
  # Return 1 if the contestant wins, 0 otherwise
  return(win)
}
# Set the number of simulations
num_simulations <- 1000

# Perform the simulations and store the results in a list
wins <- vector("list", num_simulations)

# Simulate the Monty Hall game and store the results
for (i in 1:num_simulations) {
  wins[[i]] <- MontyHall()
}

# Calculate the probability of winning if the contestant switches
win_probability <- sum(unlist(wins)) / num_simulations

# Print the estimated probability
print(win_probability)
