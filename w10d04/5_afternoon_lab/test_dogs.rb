# To run tests, run this file, make sure to have installed minitest
# gem install minitest
require 'minitest/autorun'
require 'faraday'
require 'json'

## Test Class
class TestDogs < Minitest::Test

    def test_index()
        puts("TESTING THE GET ROUTE")
        r = Faraday.get("http://localhost:3000/dogs/")
        assert r.status == 200
    end
    
    def test_create()
        puts("TESTING THE POST ROUTE")
        response = Faraday.post "http://localhost:3000/dogs/" do |request|
            request.body = {"name": "Super Dog", "age": 5}.to_json
            request.headers['Content-Type'] = 'application/json'
        end
        assert JSON.parse(response.body)["name"] == "Super Dog"
    end
    
    def test_update()
        puts("TESTING THE PUT ROUTE")

        response = Faraday.post "http://localhost:3000/dogs/" do |request|
            request.body = {"name": "Super Dog", "age": 5}.to_json
            request.headers['Content-Type'] = 'application/json'
        end

        body = JSON.parse(response.body)

        response = Faraday.put "http://localhost:3000/dogs/#{body['id']}" do |request|
            request.body = {"name": "Super Dog II", "age": 5}.to_json
            request.headers['Content-Type'] = 'application/json'
        end

        body = JSON.parse(response.body)

        assert body["name"] == "Super Dog II"
    end
    
    def test_delete()
        puts("TESTING THE DELETE ROUTE")
        response = Faraday.post "http://localhost:3000/dogs/" do |request|
            request.body = {"name": "Super Dog", "age": 5}.to_json
            request.headers['Content-Type'] = 'application/json'
        end

        body = JSON.parse(response.body)

        id = body['id']

        response = Faraday.delete("http://localhost:3000/dogs/#{id}")

        assert response.status == 204
    end
end
