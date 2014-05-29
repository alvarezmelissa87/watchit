get '/' do
  api = RottenTomato::Client.new
  movies = JSON.parse(api.movies)
  rTmovies = movies["movies"]
  @movies = []
  rTmovies.each do |movie|
    @movies << RottenTomato::Movie.new(movie)
  end
  erb :index
end