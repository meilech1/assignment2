# Assignment 2: Narcissistic Numbers

#* INFORMATION ABOUT WORKING DIRECTORY / GIT INFO GOES HERE. TBD

#* First, we will prompt the user to enter a three digit positive number. We
#* assign this to the variable 'user_value'. The prompt gives an indication
#* to the user of what kind of value we expect, but we will validate the input
#* later. For now, 'user_value' will be of type 'character' and can be anything.

user_value <- readline(prompt = "Please enter a three digit positive number: ")

#* Below is the beginning of the "Validation Block". Here we will check the user
#* input to ensure it matches the criteria: three digit positive number.

#* When a user input consists of non-digits (e.g. "abc", "%x4") the as.numeric() 
#* function returns NA because it cannot cast those strings to numbers. As such,
#* the if loop below is a condition to check the user input for non-digits. If
#* there are non digit characters, the if statement returns FALSE. If all the
#* elements in user_value are digits, they can be cast to as.numeric(). As such,
#* the IF statement returns TRUE. 

#TBD
#* We used the && (AND) operator because we only want the second part of the
#* IF statement (to the right of the & sign) to be evaluated if the first part
#* evaluates to TRUE. If the first part is FALSE, the input is not a number so
#* we don't have to bother checking that it's positive/greater than 0. This
#* makes the code more efficient. 

#TBD
#* This comment is for the second part of the IF statement below (right of &
#* sign). If the first part of the IF statement is TRUE, this will be evaluated.
#* It checks if the as.numeric() value of user_value is a positive number. 
#* Assumption made: 0 is not a positive number.

if(!is.na(as.numeric(user_value))){
  #* TRUE if user_value has been successfully casted to as.numeric()
  print(" Number input")
  
  #* Now that we know user_value is a valid number. We create a new variable
  #* user_number, which converts user_value from character to numberic type.
  #* This allows us to call user_number for the subsequent code in this block.
  
  user_number <- as.numeric(user_value)
  print(user_number)
  
  if(as.numeric(user_number) > 0 & nchar(user_number) == 3) {
    #TRUE if number is positive (assumption, 0 is not positive) AND if number has 3 digits
  } else {
    print(paste("Error! Your input number must be positive and 3 digits long.",
    user_number, "does not meet these criteria. Quitting Script..."))
  }
  
} else {
  #* FALSE if user_value includes any non-number elements (e.g. "3hs").
  #* Reminding the user of the input parameters using a print function and 
  #* showing them what they entered.
  
  print(paste("Error! Please enter a positive three digit number.", user_value,
  "is not a valid entry. Qutting Script..."))
}

