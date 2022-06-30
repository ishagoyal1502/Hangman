#!/usr/local/bin/perl
use warnings;

#all the words are saved in a file
# that file is opened and the words are stored in an array

open(my $fh,"<","data.txt"); 
my @arr=();
while(my $line=<$fh>){
	push @arr, $line;
}
close($fh);


print "Welcome to Hangman\n";
my $i=0;
while($i==0){
	$done=0;
	print "Would you like to play?(y/n): ";
	my $c=<STDIN>;
	chomp $c;
	$c=lc($c);
	if($c eq "y"){
		#using random number generator, we generate the index of the word and store the word in $word
		my $random_number=int(rand($#arr));
		$word=$arr[$random_number];
		#print $word;
		chomp ($word);
		game();
	}
	elsif($c eq "n"){
		$i=1;
	}
	else{
		print "Error\n";
	}
}

#the main game code is here

sub game{
	my @word_found=();#stores the word that has been found uptill now, checked after every correct input
	@guess_letter=(); #stores all the letters that have been guessed, wrong or right
	@guess_word=();   #stores all the word that have been guessed, wrong or right
	for(my $i=0;$i<length($word);$i++){
		push @word_found,"_ ";
	}
	print "\n"; 
	$number_of_limbs=6; #refers to number of chances left
	while($number_of_limbs!=0){
		print "Your word is: ";
		print @word_found;
		print "  (word length=";
		print length($word);
		print ")\n";
		print "Guessed letters: ";
		print @guess_letter;
		print "\n";
		print "Guessed words: ";
		print @guess_word;
		print "\n";
		print "Make a guess: ";
		@word_found=guess_word(@word_found);
		if($done==1){ #done=1 means that the player has won
			print "Congratulations!! You won the game!\n\n";
			last;
		}
		if($flag1!=1){  #flag1=1 if an already guesses word/letter has been given as an input or an incorrect letter/word has been input
				# if flag1=1, then no need to check if the current word_found is the word
			my $word_found=$word_found[0];
			for(my $j=1; $j<length($word);$j++){
				$word_found=$word_found.$word_found[$j];
			}
			if($word_found eq $word){
				print "Congratulations!! You won the game!\n\n";
				last;
			}
			else{
				print "Good guess!\nYou have $number_of_limbs chances left\n\n";
				print_hangman();
			}	
		}
		else{
			print_hangman();
		}
	}
	if($number_of_limbs==0){ #szero chances left
		print "\nYour word was $word\n";
		print "You lost! Better luck next time\n\n";
	}
	
}

#this function takes the input from the user and decides whether the input was right, wrong or invalid
sub guess_word{
	(my @word_found)=@_;
	my $flag=0; #is 1 if a letter is present in the word
	$flag1=0;   #is 1 if a wrong guess or an already guesses word/letter is input
	$done=0;    #is 1 to indicate that the game has been won 
	my $pos=0;  #tells the different indices of the word from which to start searching
	my $gu=<STDIN>; #input
	chomp $gu;
	$gu=lc($gu);
	if((length($gu) == length($word) )&& ($gu eq $word)){
		my @final_word=();
		while(length($gu)>0){
			push @final_word, chop($gu);
		}
		@word_found=reverse @final_word;
		$done=1;
		return @word_found;
	}
	if(((length($gu)!=length($word)) && (length($gu)>1))|| ($gu eq " ") || ($gu eq "\n")){
		print "Invalid input\nYou have $number_of_limbs chances left\n\n";
		$flag1=1;
		return @word_found;
	}
	$flag1=check_input($gu);
	if($flag1==1){
		return @word_found;
	}
	if((length($gu)== length($word) ) && ($gu ne $word)){
		push @guess_word,$gu." ";
		$number_of_limbs--;
		$flag1=1;
		print "Bad guess!\nYou have $number_of_limbs chances left\n\n";
	}
	else{
		push @guess_letter,$gu." ";
		while($pos<length($word)){
			my $ind=index($word,$gu,$pos);
			if($ind > (-1)){
				$word_found[$ind]=$gu;
				$flag=1;
				$pos=$ind+1;
			}
			else{
				$pos=length($word);
			}
		}
		if($flag==0){
			$number_of_limbs--;
			$flag1=1;
			print "Bad guess!\nYou have $number_of_limbs chances left\n\n";
		}	
	}	
	return @word_found;
}


#checks whether the input is already guesses before
sub check_input{
	(my $gu)=@_;
	my $flag=0;
	if(length($gu)>1){
		foreach my $i  (@guess_word){
			if(($gu." ") eq $i){
				print "Invalid move! Word already guessed\nYou have $number_of_limbs chances left\n\n";
				$flag=1;
				return $flag;
			}
		}
	}
	else{
		foreach my $i (@guess_letter){
			if(($gu." ") eq $i){
				print "Invalid move! Letter already guessed\nYou have $number_of_limbs chances left\n\n";
				$flag=1;
				return $flag;
			}
		}
	}
}


#prints the hangman	
sub print_hangman{
	if($number_of_limbs==6){
		print "   _____\n";
		print "  :     :\n";
		print "  :\n";
		print "  :\n";
		print "  :\n";
		print "  :\n";
		print "  :\n";
		print "__:__\n\n\n";
		}
	elsif($number_of_limbs==5){
		print "   _____\n";
		print "  :     :\n";
		print "  :     o\n";
		print "  :\n";
		print "  :\n";
		print "  :\n";
		print "  :\n";
		print "__:__\n\n\n";
		}
	elsif($number_of_limbs==4){
		print "   _____\n";
		print "  :     :\n";
		print "  :     o\n";
		print "  :     :\n";
		print "  :     :\n";
		print "  :\n";
		print "  :\n";
		print "__:__\n\n\n";
		}
	elsif($number_of_limbs==3){
		print "   _____\n";
		print "  :     :\n";
		print "  :     o\n";
		print '  :    \:';
		print "\n";
		print "  :     :\n";
		print "  :\n";
		print "  :\n";
		print "__:__\n\n\n";
		}
	elsif($number_of_limbs==2){
		print "   _____\n";
		print "  :     :\n";
		print "  :     o\n";
		print '  :    \:/';
		print "\n";
		print "  :     :\n";
		print "  :\n";
		print "  :\n";
		print "__:__\n\n\n";
		}
	elsif($number_of_limbs==1){
		print "   _____\n";
		print "  :     :\n";
		print "  :     o\n";
		print '  :    \:/';
		print "\n";
		print "  :     :\n";
		print '  :    /';
		print "\n";
		print "  :\n";
		print "__:__\n\n\n";
		}
	elsif($number_of_limbs==0){
		print "   _____\n";
		print "  :     :\n";
		print "  :     o\n";
		print '  :    \:/';
		print "\n";
		print "  :     :\n";
		print '  :    / \ ';
		print "\n";
		print "  :\n";
		print "__:__\n\n\n";
		}
}
