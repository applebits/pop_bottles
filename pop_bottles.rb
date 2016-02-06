require 'pry'

#Instances for tracking bottles, empties, and caps
@bottles = 0
@empty_bottles = 0
@total_caps = 0 

def buy_bottles(amount)
  @bottles = amount / 2
  @total_caps = amount / 2
  @empty_bottles = amount / 2
end

#Recycle method taking in recycle_bottles & recycle caps
def recycle
  recycling = true
  while recycling 
    while @total_caps >= 4 
      recycle_caps
    end
    while @empty_bottles >= 2 
      recycle_bottles
    end
    if @empty_bottles < 2 && @total_caps < 4 
      recycling = false
    end
  end
end

def recycle_bottles
  div_mod = @empty_bottles.divmod(2)
  bottles_earned = div_mod[0] 
  @empty_bottles = div_mod[1] + bottles_earned
  @bottles += bottles_earned
  @total_caps += bottles_earned
end

def recycle_caps
  div_mod = @total_caps.divmod(4)
  bottles_earned = div_mod[0] 
  extra_caps = div_mod[1]
  @bottles += bottles_earned
  @total_caps = extra_caps + bottles_earned
  @empty_bottles += bottles_earned
end

#REPL Menu for BUY, RECYCLE and QUIT ** resetes after RECYCLE method **
program_on = true
while program_on
  puts "Your options are: 'buy', 'recycle' 'quit'"
  command = gets.chomp

  case command
  when "buy"
    puts "How much do you want to spend on on bottles? eg. 20"
    input = gets.chomp.to_i
    buy_bottles(input) 
    puts "You receive #{@bottles} bottles!"
  when "recycle"
    puts "You are recycling!"
    recycle
    puts "You have #{@empty_bottles} empty bottle/s and #{@total_caps} cap/s left over!"
    puts "Thanks for coming by!"
    @bottles = 0
    @total_caps = 0
  when "quit"
    program_on = false
    exit
  else
    puts "Input not recognized, please try again."
  end
end

