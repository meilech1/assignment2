# Assignment 2: Narcissistic Numbers

#* INFORMATION ABOUT WORKING DIRECTORY / GIT INFO GOES HERE. TBD

#* First, we will prompt the user to enter a three digit positive number. We
#* assign this to the variable 'user_value'. The prompt gives an indication
#* to the user of what kind of value we expect, but we will validate the input
#* later. For now, 'user_value' will be of type 'character' and can be anything.

user_value <- readline(prompt = "Please enter a three digit positive number: ")


#* When a user input consists of non-digits (e.g. "abc", "%x1") the as.numeric()
#* function returns NA because it cannot cast those strings to numbers. As such,
#* the if loop below is a condition to check the user input for non-digits. If
#* there are non digit characters, the if statement returns FALSE. If all the
#* elements in user_value are digits, they can be cast to as.numeric(). As such,
#* the IF statement returns TRUE. 

if(!is.na(as.numeric(user_value))){
  # TRUE if user_value has been successfully casted to as.numeric()
  print("Number input")
  
} else {
  # FALSE if user_value includes any non-number elements (e.g. "1hs")
  print("Non-number input")
}

# Check if user_value is numeric when cast in as.numeric function. 
# Assuming, number has to be > 0 as 0 is neither positive or negative (000)
# Check if it's an integer
#if(is.numeric(as.numeric(user_value)) & as.numeric(user_value) > 0) {
  # is a number and greater than 0 
  #print("number greater than 0")
  
#} else {
  # User input is not a positive number 
 # print("not a positive number")
#}

