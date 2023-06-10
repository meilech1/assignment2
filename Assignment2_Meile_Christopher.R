# Assignment 2: Narcissistic Numbers

#* This script is available via Github. User: meilech1. Repo: assignment2
#* Link to Public Repo: https://github.com/meilech1/assignment2
#* Note: to run this script, please press 'Source' at the top right in R Studio.

#* ASSUMPTION OVERVIEW: 
#* Below you will see a list of assumptions that have been made in the 
#* classification of Narcissistic Numbers. 
#* (1) 0 is not a positive number.
#* (2) narcissistic numbers must be 3-digit long positive integers. Decimal
#* numbers will not be processed as a valid user input. 

#* First, we will prompt the user to enter a three digit positive number. This
#* is achieved using the readline() function which reads user input.
#* We assign this to the variable 'user_value'. The prompt gives an indication
#* to the user of what kind of value we expect, but we will validate the input
#* later. For now, 'user_value' will be of type 'character' and could be anything.

user_value <- readline(prompt = "Please enter a three digit positive integer: ")

#* Below is the beginning of the "Validation Block". Here we will check the user
#* input to ensure it matches the criteria: three digit positive number.

#* When a user input consists of non-digits (e.g. "abc", "%x4") the as.numeric() 
#* function returns NA because it cannot cast those strings to numbers. As such,
#* the if loop below is a condition to check the user input for non-digits. If
#* there are any non-digit characters, the if statement returns FALSE. If all 
#* elements in 'user_value' are digits, they can be cast to as.numeric(). 
#* As such, the IF statement would return TRUE. 

if(!is.na(as.numeric(user_value))) {
  
  #* Now that we know 'user_value' is a number we create a new variable
  #* 'user_number', which converts 'user_value' from character to numeric type.
  #* This allows us to call user_number for the subsequent code in this block.
  
  user_number <- as.numeric(user_value)
  
  #* The nested IF statement below checks three criteria: 
  #* (1) First, it checks that the converted 'user_number' is greater than 0. 
  #* This is our criteria for the input being a positive number. 
  #* Assumption made: 0 is not a positive number. 
  #* (2) Second, the IF statement checks if the number of characters in
  #* the number is equal to three. This is done using the nchar() function.
  #* This is our three digit criteria. 
  #* (3) The third condition checks a potential risk with the 2 conditions above.
  #* If the user inputs number "1.3" both the conditions above will return TRUE. 
  #* However, we will make the assumption that narcissistic numbers can only
  #* be integers. As such, the third condition checks if the 'user_number' is
  #* an integer by checking if the mod (%%) of the 'user_number' when divided by
  #* 1 returns 0. This is only true for integers with no decimals. is.integer()
  #* was not used instead because as.numeric() on line 38 will return a type 
  #* 'double'.  In this case if we have a double the condition is still passed 
  #* without having to restrict the type to integers only. If we had used 
  #* as.integer() on line 38 instead of as.numeric() then decimals would have 
  #* been rounded to integers. We don't want this as decimals should not be 
  #* classified as a valid user input.
  #* If any of these 3 criteria are not met, the else  block prints an error to 
  #* the user with a prompt describing the error and what the user's input was. 
  #* Script then terminates. 
  
  
  if(user_number > 0 & nchar(user_number) == 3 & (user_number %% 1 == 0)) {
    #* TRUE if 'user_number' is positive AND if 'user_number' has 3 digits AND 
    #* if 'user_number' is an integer. This marks the end of our 
    #* "User Input Validation" block. 
    
    #* Below we are creating a new vector 'digit_vector' that will contain
    #* all of the individual digits from 'user_number'. First, we cast the
    #* 'user_number' to a character type using as.character(). The reason is
    #* that it is easier to split strings than integers that are not stored
    #* element-wise, whereas strings are. Additionally, with it as a character
    #* type, we can use the strsplit() function. This function takes
    #* in the 'user_number' string and splits its elements into a nested list. 
    #* The second argument in strsplit() is an empty string "" which indicates
    #* that the split should occur after every character. 
    #* Since the digits are now in a nested list, we can access these using
    #* the index [[1]], as they will be in the first (and only) sub-list item.
    #* Lastly, we cast as.numeric() onto this whole function including the
    #* index subscript, to convert all the items in this sub-list back to
    #* numeric objects rather than character types. This allows us to get
    #* a vector of doubles, stored in 'digit_vector'.
    
    digit_vector <- as.numeric(strsplit(as.character(user_number), "")[[1]])
    
    #* To calculate the narcissistic numbers we then create a new variable 
    #* 'sum_digits_cubed' which first cubes every digit in 'digit_vector' and
    #* then sums these cubed values together. See below: 

    sum_digits_cubed <- sum(digit_vector ^ 3)
    
    #* We then run an IF statement to check if the 'sum_digits_cubed' is equal
    #* to the numerical value of 'user_number'. Both are type: double, so the
    #* comparison operator will work as expected. If the condition yields TRUE
    #* we have a narcissistic number, where the sum of each digit cubed is
    #* the same as the original three digit positive number. If the condition
    #* yields FALSE, the 'user_number' is not a narcissistic number. 
    
    if(sum_digits_cubed == user_number){
      
      #* If the 'user_number' is a narcissistic number, print this finding to
      #* the console and also print the 'user_number'. End of script.
      
      print(paste(user_number, "is a Narcissistic Number! I guess", user_number,
                  "loves to make it all about themselves..."))
    } else {
      
      #* If the 'user_number' is NOT a narcissistic number, print this finding
      #* to the console and also print the 'user_number'. End of script.
      
      print(paste(user_number, "is not a Narcissistic Number."))
      
    }
    
  } else {
    #* Else statement for our nested 'user_number' validation block. 
    #* FALSE if 'user_number" is not positive OR if the number of characters
    #* does not equal to three OR if the 'user_number' is not an integer. 
    #* Prints error to console and tells user that their input did not meet 
    #* these criteria. Prints user's input to indicate what their input was. 
    
    print(paste("Error! The input number must be a positive 3 digit long integer.",
    user_number, "does not meet these criteria. Quitting Script..."))
  }
  
} else {
  #* Else statement for the 'user_value' non-digit check. 
  #* FALSE if user_value includes any non-number elements (e.g. "3hs").
  #* Reminding the user of the input parameters using a print function and 
  #* showing them what they entered.
  
  print(paste("Error! Please enter a positive three digit integer", user_value,
  "is not a valid entry. Qutting Script..."))
}
