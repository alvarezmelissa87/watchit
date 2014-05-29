get '/' do
  api = RottenTomato::Client.new
  movies = JSON.parse(api.movies)
  @movies = movies["movies"]
  p @movies
  @movies.each do |movie|
    RottenTomato::Movie.new(movie)
  end
  erb :index
end