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

  # [{"id"=>"10055", "title"=>"Beetlejuice", "year"=>1988, "mpaa_rating"=>"PG", "runtime"=>93, "release_dates"=>{"theater"=>"1988-03-30", "dvd"=>"1997-06-26"}, "ratings"=>{"critics_rating"=>"Certified Fresh", "critics_score"=>81, "audience_rating"=>"Upright", "audience_score"=>82}, "synopsis"=>"", "posters"=>{"thumbnail"=>"http://content9.flixster.com/movie/11/16/68/11166863_mob.jpg", "profile"=>"http://content9.flixster.com/movie/11/16/68/11166863_pro.jpg", "detailed"=>"http://content9.flixster.com/movie/11/16/68/11166863_det.jpg", "original"=>"http://content9.flixster.com/movie/11/16/68/11166863_ori.jpg"}, "abridged_cast"=>[{"name"=>"Alec Baldwin", "id"=>"162656441", "characters"=>["Adam Maitland"]}, {"name"=>"Geena Davis", "id"=>"162659514", "characters"=>["Barbara Maitland"]}, {"name"=>"Michael Keaton", "id"=>"162652681", "characters"=>["Betelgeuse"]}, {"name"=>"Jeffrey Jones", "id"=>"162668540", "characters"=>["Charles Deetz"]}, {"name"=>"Catherine O'Hara", "id"=>"162658234", "characters"=>["Delia Deetz"]}], "alternate_ids"=>{"imdb"=>"0094721"}, "links"=>{"self"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/10055.json", "alternate"=>"http://www.rottentomatoes.com/m/beetlejuice/", "cast"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/10055/cast.json", "clips"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/10055/clips.json", "reviews"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/10055/reviews.json", "similar"=>"http://api.rottentomatoes.com/api/public/v1.0/movies/10055/similar.json"}}]
  @movie = RottenTomato::Movie.new(movie["movies"])

  session[:title] = @movie
end

get '/movie' do
  @movie = session[:title]
  erb :movie_search
end