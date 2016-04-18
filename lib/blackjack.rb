def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card_total = deal_card + deal_card
  display_card_total(card_total)
  return card_total # otherwise would return a string from #display_card_total
end

# argument: have to know what current card total is before we can update after
# hitting or leave the same if we stay
# test will say 'wrong number of arguments (1 for 0)' b/c rspec passed an arg
# that wasn't in our method
def hit?(card_total)
  prompt_user
  player_choice = get_user_input
  if player_choice == "h"
    card_total = deal_card + card_total # or 'card_total += deal_card'
  elsif player_choice == "s"
    card_total # do not update 'card_total'
  else
    invalid_command(card_total) # other input will call #hit? again
  end
end

def invalid_command(card_total)
  puts "Hey Dicknose, enter 'h' to hit or 's' to stay!"
  puts "Your cards add up to #{card_total}"
  hit?(card_total)
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  card_total = initial_round # set this to card_total otherwise will get
  #undefined local variable error

  until card_total > 21 do
    card_total = hit?(card_total) # update card_total
    display_card_total(card_total)
  end
  
  end_game(card_total)
end

runner # call runner to play
