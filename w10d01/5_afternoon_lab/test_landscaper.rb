# To run tests, run this file, make sure to have installed minitest
# gem install minitest
require 'minitest/autorun'
require_relative 'landscaper'

## Test Class
class TestLandscaper < Minitest::Test

    ## Test that the selection function when passed one will increased $money by 1
    def test_selection_mow()
        puts("TESTING THE SELECTION AND MOW FUNCTION")
        selection("1")
        assert $money == 1
    end

    ## Test that upgrade function increments $current_tool by 1
    def test_selection_upgrade()
        puts("TESTING THE SELECTION AND UPGRADE FUNCTION")
        $money = 5
        selection("2")
        assert $current_tool == 1
    end

    ## Test win condition works
    def test_win_conditions()
        puts("TESTING THE WIN CONDITIONS FUNCTION")
        $money = 1000
        $current_tool = 4
        assert win_conditions() == true
    end
end
