#HANGMAN

The program reads all the words from the text file data.txt
The words are stored in an array
Using a random number generator, one word is picked

The program then takes an input from the user
A single letter or a word of the same length as the selected word is considered valid input
Anything else is considered as an invalid input
All the letters/words guessed are stored in arrays
The input is not case sensitive

At every turn the program displays the letter/words already guessed right or wrong
It also displays the number of chances left
Chance decreases by one when a wrong letter/word has been given as an input
Invalid inputs do not have an effect on the number of chances
Already guessed input also do not have an impact on the number of chances

The program maintains an array called word_found
It stores the part of the selected word that has been found

Once the input is taken, it is checked whether it is valid or not
If found valid then it checks if the word/letter has already been guessed or not
If it is found to be a new letter/word then we check for its correctness
In the case of a letter, we try to find the indices of the occurence of that letter in the selected word
If there are no indices that means the letter is wrong 
If indices are found then the letter is placed in its rightful place in the word_found array

If the input letter is found to be a part of the selected word then 
the word_found array is converted into a string and compared with the selected word
If found equal then winner is declared
If not then the game continues
Similarly if the input word is found to be correct then directly winner is declared

EXAMPLE:

Welcome to Hangman
Would you like to play?(y/n): y

Your word is: _ _ _ _ _ _   (word length=6)
Guessed letters: 
Guessed words: 
Make a guess: o
Good guess!
You have 6 chances left

   _____
  :     :
  :
  :
  :
  :
  :
__:__


Your word is: _ o_ _ _ _   (word length=6)
Guessed letters: o 
Guessed words: 
Make a guess: L
Good guess!
You have 6 chances left

   _____
  :     :
  :
  :
  :
  :
  :
__:__


Your word is: _ ol_ _ _   (word length=6)
Guessed letters: o l 
Guessed words: 
Make a guess: k
Bad guess!
You have 5 chances left

   _____
  :     :
  :     o
  :
  :
  :
  :
__:__


Your word is: _ ol_ _ _   (word length=6)
Guessed letters: o l k 
Guessed words: 
Make a guess: o
Invalid move! Letter already guessed
You have 5 chances left

   _____
  :     :
  :     o
  :
  :
  :
  :
__:__


Your word is: _ ol_ _ _   (word length=6)
Guessed letters: o l k 
Guessed words: 
Make a guess: pol
Invalid input
You have 5 chances left

   _____
  :     :
  :     o
  :
  :
  :
  :
__:__


Your word is: _ ol_ _ _   (word length=6)
Guessed letters: o l k 
Guessed words: 
Make a guess: policy
Bad guess!
You have 4 chances left

   _____
  :     :
  :     o
  :     :
  :     :
  :
  :
__:__


Your word is: _ ol_ _ _   (word length=6)
Guessed letters: o l k 
Guessed words: policy 
Make a guess: police
Congratulations!! You won the game!

Would you like to play?(y/n): y

Your word is: _ _ _ _ _ _ _ _   (word length=8)
Guessed letters: 
Guessed words: 
Make a guess: a
Bad guess!
You have 5 chances left

   _____
  :     :
  :     o
  :
  :
  :
  :
__:__


Your word is: _ _ _ _ _ _ _ _   (word length=8)
Guessed letters: a 
Guessed words: 
Make a guess: b
Bad guess!
You have 4 chances left

   _____
  :     :
  :     o
  :     :
  :     :
  :
  :
__:__


Your word is: _ _ _ _ _ _ _ _   (word length=8)
Guessed letters: a b 
Guessed words: 
Make a guess: c
Good guess!
You have 4 chances left

   _____
  :     :
  :     o
  :     :
  :     :
  :
  :
__:__


Your word is: c_ _ _ _ _ _ _   (word length=8)
Guessed letters: a b c 
Guessed words: 
Make a guess: d
Bad guess!
You have 3 chances left

   _____
  :     :
  :     o
  :    \:
  :     :
  :
  :
__:__


Your word is: c_ _ _ _ _ _ _   (word length=8)
Guessed letters: a b c d 
Guessed words: 
Make a guess: f
Bad guess!
You have 2 chances left

   _____
  :     :
  :     o
  :    \:/
  :     :
  :
  :
__:__


Your word is: c_ _ _ _ _ _ _   (word length=8)
Guessed letters: a b c d f 
Guessed words: 
Make a guess: g
Bad guess!
You have 1 chances left

   _____
  :     :
  :     o
  :    \:/
  :     :
  :    /
  :
__:__


Your word is: c_ _ _ _ _ _ _   (word length=8)
Guessed letters: a b c d f g 
Guessed words: 
Make a guess: h    
Bad guess!
You have 0 chances left

   _____
  :     :
  :     o
  :    \:/
  :     :
  :    / \ 
  :
__:__



Your word was computer
You lost! Better luck next time

Would you like to play?(y/n): n