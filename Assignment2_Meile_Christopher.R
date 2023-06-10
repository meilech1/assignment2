# Assignment 2: Narcissistic Numbers

#* INFORMATION ABOUT WORKING DIRECTORY / GIT INFO GOES HERE. TBD

#* First, we will prompt the user to enter a three digit positive number. We
#* assign this to the variable 'user_value'. The prompt gives an indication
#* to the user of what kind of value we expect, but we will validate the input
#* later. For now, 'user_value' will be of type 'character' and can be anything.

user_value <- readline(prompt = "Please enter a three digit positive number: ")

print(is.na(user_value))
# Check if user_value is numeric when cast in as.numeric function. 
# Assuming, number has to be > 0 as 0 is neither positive or negative (000)
# Check if it's an integer
if(is.numeric(as.numeric(user_value)) & as.numeric(user_value) > 0) {
  # is a number and greater than 0 
  print("number greater than 0")
  
} else {
  # User input is not a positive number 
  print("not a positive number")
}

