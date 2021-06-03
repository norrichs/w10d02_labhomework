$names = ["Diesel", "Stallone", "Statham", "Willis", "Van Damme", "Segal", "Li", "Lundgren"]

## The ship class for creating the ships in the game
class Ship

    ## Set Getters and Setters
    attr_accessor :hull, :firepower, :accuracy, :name

    ## Constructor, should create hull, firepower and accuracy properties
    def initialize(hull, firepower, accuracy, name=get_shipname())
        @hull = hull
        @firepower = firepower
        @accuracy = accuracy
        @name = name
    end

end

## generateHull should generate a number between 3 & 6
## readup on standard python random library that is imported into this file
## https://docs.python.org/3/library/random.html
def generateHull()
    Random.rand(3..6)
end

## generateFirepower should generate a number between 2 & 4
def generateFirepower()
    Random.rand(2..4)
end

## generateAccuracy should generate a number between .6 & .8
def generateAccuracy()
    Random.rand(0.6...0.8)
end

## Should return a list of 6 Enemy ships with random stands
def enemy_fleet()
    fleet = []
    for i in 0..5
        fleet[i] = Ship.new(generateHull(), generateFirepower(), generateAccuracy(), get_shipname())
    end
    return fleet
end

## return a random, non duplicating ship name
def get_shipname()
    ## get's a random ship name, removing from array
    
    return $names.slice!(Random.rand(0...$names.length))
end

## accuracy_check should
# - be passed an attacking ships accuracy
# - generate a random number between 0-1
# - If that number is equal or below the ships accuracy return true
# - If that number is above the ships return false
def accuracy_check(acc)
    check = Random.rand(0.0..1.0)
    if check <= acc
        return true
    end
    return false
end

## Battle, should take an attacking and defending ship
# - If an accuracy check passes
# - the defending ships hull should be reduced by the attacking ships firepower
# - if misses return false
def battle(attacker, defender)
    if accuracy_check(attacker.accuracy)
        defender.hull -= attacker.firepower
        battle_msg = "#{attacker.name} successfully attacks #{defender.name}.  #{defender.name} takes #{attacker.firepower} damage."
    else
        battle_msg = "#{attacker.name} whiffs it.  No damage."
    end

    if defender.hull > 0
        status_msg =  "#{defender.name} hull @ #{defender.hull}"
    else
        status_msg = "#{defender.name} is sinking!"
    end
    puts("#{battle_msg} #{status_msg}")
    return false
end

##full_battle should loop and allow two ships to attack each other until one dies.
## if ship wins, return true
## if ship2 wins, return false
def full_battle(ship, ship2)
    while ship.hull > 0 && ship2.hull > 0
        battle(ship, ship2)
        battle(ship2, ship)
    end
    return ship.hull > 0
end
        
def print_fleet
    puts     " NAME       | HULL | FIRE | ACC  "
    for enemy in $enemies
        puts "#{enemy.name} | #{enemy.hull}     | #{enemy.firepower}     | #{enemy.accuracy}"
    end
end

## Game Setup
$enemies = enemy_fleet
$you = Ship.new(20, 5, 0.7, "Schwarzenegger")

## Game Loop Function
def game_loop()
    puts("Welcome to Space Battle, you are on the USS Schwarzenegger and six ships have come to attack")
    print_fleet()
    # While $enemies still exist in enemy fleet battle the next ship
    while(full_battle($you, $enemies[0]))
        ## remove defeated ship from list
        $enemies.shift
        ## If no $enemies left, you win
        if ($enemies.length() <= 0)
            puts("you have defeated the enemy fleet!")
            break
        end
        ## Ask user if they want escape
        puts("type 'escape' if you want to escape or hit enter to battle next ship") 
        if(gets.chomp.to_i == "escape")
            puts("You have escaped")
        end
        puts("\nYou face the next enemy ship, #{$enemies[0].name}")
    end
end