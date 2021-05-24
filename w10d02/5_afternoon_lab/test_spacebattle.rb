# To run tests, run this file, make sure to have installed minitest
# gem install minitest
require 'minitest/autorun'
require_relative 'spacebattle'

## Test Class
class TestSpacebattle < Minitest::Test

    def test_generateHull()
        print("TESTING THE GENERATE HULL FUNCTION")
        num = 0
        num += generateHull()
        num += generateHull()
        num += generateHull()
        assert num >= 9 and num <= 27
    end
    
    def test_generateFirepower()
        print("TESTING THE GENERATE FIREPOWER FUNCTION")
        num = 0
        num += generateFirepower()
        num += generateFirepower()
        num += generateFirepower()
        assert num >= 6 and num <= 12
    end
    
    def test_generateAccuracy()
        print("TESTING THE GENERATE ACCURACY FUNCTION")
        num = 0
        num += generateAccuracy()
        num += generateAccuracy()
        num += generateAccuracy()
        assert num >= 1.8 and num <= 2.4
    end
    
    def test_enemy_fleet()
        print("TESTING THE ENEMY FLEET FUNCTION")
        fleet = enemy_fleet
        for ship in fleet
            assert ship.hull >= 3 and ship.hull <= 6
            assert ship.firepower >= 2 and ship.firepower <= 4
            assert ship.accuracy >= 0.6 and ship.accuracy <= 0.8
        end
    end
    
    def test_accuracy_check()
        print("TESTING THE ACCURACY CHECK FUNCTION")
        assert accuracy_check(0) == false
        assert accuracy_check(1) == true
    end
    
    def test_battle()
        print("TESTING THE BATTLE FUNCTION")
        ship1 = Ship.new(20, 5, 0)
        ship2 = Ship.new(20, 5, 1)
        assert battle(ship1, ship2) == false
        battle(ship2, ship1)
        assert ship1.hull == 15
    end
    
    def test_full_battle()
        print("TESTING THE FULL BATTLE FUNCTION")
        ship1 = Ship.new(20, 5, 0)
        ship2 = Ship.new(20, 5, 1)
        result = full_battle(ship1, ship2)
        assert result == true || result == false
    end
end
