## The ship class for creating the ships in the game
class Ship

    ## Set Getters and Setters
    attr_accessor :hull, :firepower, :accuracy

    ## Constructor, should create hull, firepower and accuracy properties
    def initialize(hull, firepower, accuracy)
        @hull = hull
        @firepower = firepower
        @accuracy = accuracy
    end
end

## generateHull should generate a number between 3 & 6
## readup on standard python random library that is imported into this file
## https://docs.python.org/3/library/random.html
def generateHull()
    num = rand(3..6)
    return num
end

## generateFirepower should generate a number between 2 & 4
def generateFirepower()
    num = rand(2..4)
    return num
end

## generateAccuracy should generate a number between .6 & .8
def generateAccuracy()
    num = rand(0.6..0.8)
    return num
end

## Should return a list of 6 Enemy ships with random stands
def enemy_fleet()
    enemies = []
    for i in 0..6
        enemies.append(Ship.new(generateHull, generateFirepower, generateAccuracy))
    end
    return enemies
end

## accuracy_check should
# - be passed an attacking ships accuracy
# - generate a random number between 0-1
# - If that number is equal or below the ships accuracy return true
# - If that number is above the ships return false
def accuracy_check(acc)
    num = rand()
    if (num <= acc)
        return true
    else
        return false
    end
end

## Battle, should take an attacking and defending ship
# - If an accuracy check passes
# - the defending ships hull should be reduced by the attacking ships firepower
# - if misses return false
def battle(attacker, defender)
    if(accuracy_check(attacker.accuracy))
        defender.hull -= attacker.firepower
        puts("Attacker succeeds, defender left with #{defender.hull}")
    else
        puts("Attacker misses")
        return false
    end
end

##full_battle should loop and allow two ships to attack each other until one dies.
## if ship wins, return true
## if ship2 wins, return false
def full_battle(ship, ship2)
    while(true)
        puts("You attack the ship")
        battle(ship, ship2)
        if(ship2.hull <= 0)
            puts("you defeated enemy ship!")
            return true
        end
        puts("You are attacked")
        battle(ship2, ship)
        if(ship.hull <= 0)
            puts("You were defeated")
            return false
        end
    end
end
        

## Game Setup
$enemies = enemy_fleet
$you = Ship.new(20, 5, 0.7)

## Game Loop Function
def game_loop()
    puts("Welcome to Space Battle, you are on the USS Schwarzenegger and six ships have come to attack")
    # While $enemies still exist in enemy fleet battle the next ship
    while(full_battle($you, $enemies[0]))
        ## remove defeated ship from list
        $enemies.shift
        ## If no $enemies left, you win
        if ($enemies.length <= 0)
            puts("you have defeated the enemy fleet!")
            break
        end
        ## Ask user if they want escape
        puts("type 'escape' if you want to escape or battle next ship") 
        if(gets.chomp.to_i == "escape")
            puts("You have escaped")
        end
        puts("You face the next enemy ship")
    end
end