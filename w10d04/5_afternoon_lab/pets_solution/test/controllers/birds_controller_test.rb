require "test_helper"

class BirdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bird = birds(:one)
  end

  test "should get index" do
    get birds_url, as: :json
    assert_response :success
  end

  test "should create bird" do
    assert_difference('Bird.count') do
      post birds_url, params: { bird: { age: @bird.age, name: @bird.name } }, as: :json
    end

    assert_response 201
  end

  test "should show bird" do
    get bird_url(@bird), as: :json
    assert_response :success
  end

  test "should update bird" do
    patch bird_url(@bird), params: { bird: { age: @bird.age, name: @bird.name } }, as: :json
    assert_response 200
  end

  test "should destroy bird" do
    assert_difference('Bird.count', -1) do
      delete bird_url(@bird), as: :json
    end

    assert_response 204
  end
end
