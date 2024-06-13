require 'rest-client'
require 'json'

API_URL = 'https://tmdb.lewagon.com/movie/top_rated'
BASE_IMAGE_URL = 'https://image.tmdb.org/t/p/w500'

response = RestClient.get(API_URL)

data = JSON.parse(response.body)["results"]

data.each do |item|
  poster_link = "#{BASE_IMAGE_URL}#{item['poster_path']}"
  Movie.create!(
    title: item['title'],
    overview: item['overview'],
    rating: item['vote_average'],
    poster_url: poster_link
  )
end
