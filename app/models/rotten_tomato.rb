require 'json'
require 'httparty'

module RottenTomato

  class Client
    include HTTParty

    base_uri "http://api.rottentomatoes.com/api/public/v1.0"

    def initialize
    end

    def movies
      response = self.class.get("/lists/movies/opening.json?limit=10&country=us&apikey=#{KEY}")
                  # this call returns 10 movies in theaters in the US
      return response.body
    end

    def movie(title)
      response = self.class.get("/movies.json?q=#{title}&page_limit=10&page=1&apikey=#{KEY}")
      return response.body
    end
  end

  class Movie
    attr_reader :title, :rating, :synopsis, :image
    def initialize(args)
      @title = args["title"]
      @rating = args["ratings"]["audience_score"] # rating: {audience_score: value} need to access nested hash
      @synopsis = args["synopsis"]
      @image = args["posters"]["thumbnail"]
    end

    def short_synopsis
       short = @synopsis.slice(0,150)
       return  short + "..."
    end
  end

  class SingleMovie
    attr_reader :title, :year, :mpaa_rating, :runtime,
    :critics_rating, :critics_score, :audience_ratin,
    :audience_score, :synopsis, :image

    def initialize(args)
      @title = args["title"]
      @year = args["year"]
      @ratiing = args["mpaa_rating"]
      @runtime = args["runtime"]
      @critic_rating = args["ratings"]["critics_rating"]
      @critic_score = args["ratings"]["critics_score"]

    end

  end
end