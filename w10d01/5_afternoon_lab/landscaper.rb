## Array of$tools
$tools = [
    {name: "Teeth", income:1, price: 0},
    {name: "Rusty Scissors", income:5, price: 5},
    {name: "Push Mower", income:50, price: 25},
    {name: "Fancy Mower", income:100, price: 250},
    {name: "Starving Students", income:250, price: 500},
]

## Game State
$current_tool = 0
$money = 0
$first = true


## start function should
# - puts a message introducing the game and options
# - take gets.chomp from the user (1 = buy 2 = mow)
# - return that gets.chomp
# This function does NOT have a test
def start()
    if $first
        puts "Welcome to Capitalist Hellscape 2000"
        $first = false
    end
    puts "You have $#{$money} and you're mowing with #{$tools[$current_tool][:name]}
Enter 1 to mow, 2 to upgrade"
    sel = gets.chomp
    return sel
end

## selection function should
# - if user gets.chomp is 1, run the mow function
# - if user gets.chomp is 2, run the upgrade function
# - if anything else, text warning
def selection(select)
    if select.to_i == 2
        upgrade()
    elsif select.to_i == 1
        mow()
    else
        puts "read the instructions!  1 or 2 only"
    end
end


## mow function
# to refer to global variables look up defining variables with $
# - should up income based on $current_tool &$tools list
# - puts message
def mow()
    $money += $tools[$current_tool][:income]
    puts "you earned $#{$tools[$current_tool][:income]}\nyou have $#{$money}"
end

## upgrade function
# - check to see if $money is enough to buy the next tool
# - if so upgrades tool by incrementing $current_tool and running win_conditions
# - if not, puts message saying $money isn't enough
def upgrade()
    # puts "upgrading ur tool"
    if $money >= $tools[$current_tool+1][:price]
        $money -= $tools[$current_tool+1][:price]
        $current_tool += 1
        win_conditions()
    else
        puts "$#{$money} isn't enought to buy a #{$tools[$current_tool+1][:name]}"
    end

end



## the win_conditions functions
# check if the current tool is the team and $money is 1000
# If true, puts a win message then return true
# If false, puts the players $money total and tool and run game_loop()
def win_conditions()
    if $money >= 1000 && $tools[$current_tool][:name] == "Starving Students"
        puts "you win.  niiiiice."
        return true
    else
        game_loop()
    end
end





## GAME LOOP

def game_loop()
    ## get users gets.chomp
    select = start()
    ## run a particular action
    selection(select)
    ## check win conditions and start again
    win_conditions()
end