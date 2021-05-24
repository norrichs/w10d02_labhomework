# To run tests, run this file, make sure to have installed minitest
# gem install minitest
require 'minitest/autorun'
require 'faraday'
require 'json'

## Test Class
class TestBlogs < Minitest::Test

    def test_index()
        puts("TESTING THE GET ROUTE")
        r = Faraday.get("http://localhost:3000/blogs/")
        assert r.status == 200
    end
    
    def test_create()
        puts("TESTING THE POST ROUTE")
        response = Faraday.post "http://localhost:3000/blogs/" do |request|
            request.body = {"title": "Super Blog", "body": "fsdadfasdf"}.to_json
            request.headers['Content-Type'] = 'application/json'
        end
        assert JSON.parse(response.body)["title"] == "Super Blog"
    end
    
    def test_update()
        puts("TESTING THE PUT ROUTE")

        response = Faraday.post "http://localhost:3000/blogs/" do |request|
            request.body = {"title": "Super Blog", "body": "dfadfadafd"}.to_json
            request.headers['Content-Type'] = 'application/json'
        end

        body = JSON.parse(response.body)

        response = Faraday.put "http://localhost:3000/blogs/#{body['id']}" do |request|
            request.body = {"title": "Super Blog II", "body": 5}.to_json
            request.headers['Content-Type'] = 'application/json'
        end

        body = JSON.parse(response.body)

        assert body["title"] == "Super Blog II"
    end
    
    def test_delete()
        puts("TESTING THE DELETE ROUTE")
        response = Faraday.post "http://localhost:3000/blogs/" do |request|
            request.body = {"title": "Super Blog", "body": "dfsdfsdf"}.to_json
            request.headers['Content-Type'] = 'application/json'
        end

        body = JSON.parse(response.body)

        id = body['id']

        response = Faraday.delete("http://localhost:3000/blogs/#{id}")

        assert response.status == 204
    end
end
