get '/' do
  api = RottenTomato::Client.new
  @movies = JSON.parse(api.movies)
  @movies.map! do |movie|
    RottenTomato::Movie.new(movies[:movie])
  end
  erb :index
end