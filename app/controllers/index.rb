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

post '/' do
  api = RottenTomato::Client.new
  movie = JSON.parse(api.movie(params[:title]))
  p movie["movies"]
  @movie = RottenTomato::SingleMovie.new(movie["movies"].first)
  session[:title] = @movie
  p session[:title]
  redirect '/movie'
end

get '/movie' do
  @movie = session[:title]
  erb :movie_search
end
