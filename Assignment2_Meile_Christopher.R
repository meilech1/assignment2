# Assignment 2: Narcissistic Numbers

#* INFORMATION ABOUT WORKING DIRECTORY / GIT INFO GOES HERE. TBD
#* ASSUMPTION OVERVIEW.. will be touched upon later
#* (1) 0 is not a positive number
#* (2) narcissic numbers must be 3-digit long positive integers. 

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

if(!is.na(as.numeric(user_value))){
  
  #* Now that we know user_value is a valid number. We create a new variable
  #* user_number, which converts user_value from character to numberic type.
  #* This allows us to call user_number for the subsequent code in this block.
  
  user_number <- as.numeric(user_value)
  
  #* The nested IF statement below checks three criteria: 
  #* (1) First, it checks that the converted 'user_number' is greater than 0. 
  #* This is our criteria for the input being a positive number. Assumption: 0 
  #* is not a positive number. 
  #* (2) Second, the IF statement checks if the number of characters in
  #* the number is equal to three. This is done using the nchar() function.
  #* This is our three digit criteria. 
  #* (3) The third condition checks a potential risk with the 2 conditions above.
  #* If the user inputs number "1.3" both the conditions above will return TRUE. 
  #* However, we will make the assumption that narcissistic numbers can only
  #* be integers. As such, the third condition checks if the 'user_number' is
  #* an integer by checking if the mod (%%) of the 'user_number' when divided by
  #* 1 returns 0. This is only true for integers with no decimals. is.integer()
  #* was not used instead because as.numeric() above will return a type 'double'.
  #* In this case if we have a double the condition is still passed without
  #* having to restrict the type to integers only. 
  #* If any of these 3 criteria are not met, the else  block prints an error to 
  #* the user with a prompt describing the error and what the user's input was. 
  #* Script then terminates. 
  
  
  if(user_number > 0 & nchar(user_number) == 3 & (user_number %% 1 == 0)) {
    #* TRUE if 'user_number' is positive AND if 'user_number' has 3 digits AND 
    #* if 'user_number' is an integer. This marks the end of our 
    #* "User Input Validation" block. 
    
    #* Below we are creating a new vector 'digit_vector' that will contain
    #* all of the individual digits from 'user_number'. 
    
    digit_vector <- as.numeric(strsplit(as.character(user_number), "")[[1]])
    sum_digits_cubed <- sum(digit_vector ^ 3)
    
    if(sum_digits_cubed == user_number){
      
      print(paste(user_number, "is a Narcissistic Number! I guess", user_number,
                  "loves to make it all about themselves..."))
    } else {
      print(paste(user_number, "is not a Narcissistic Number."))
      
    }
    
  } else {
    #* FALSE if 'user_number" is not positive OR if the number of characters
    #* does not equal to three. Prints error to console and tells user
    #* that their input did not meet these criteria. Prints user's input to
    #* indicate what their input was. 
    
    print(paste("Error! The input number must be a positive 3 digit long integer.",
    user_number, "does not meet these criteria. Quitting Script..."))
  }
  
} else {
  #* FALSE if user_value includes any non-number elements (e.g. "3hs").
  #* Reminding the user of the input parameters using a print function and 
  #* showing them what they entered.
  
  print(paste("Error! Please enter a positive three digit integer", user_value,
  "is not a valid entry. Qutting Script..."))
}
