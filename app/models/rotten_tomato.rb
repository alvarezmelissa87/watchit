require 'json'
require 'httparty'

module RottenTomato

  class Client
    include HTTParty

    base_uri "http://api.rottentomatoes.com/api/public/v1.0."

    def initialize
    end

    def movies
      # response = self.class.get("/lists/movies/opening.json?limit=10&country=us&apikey=#{KEY}")
                  # this call returns 10 movies in theaters in the US
        response = self.class.get ("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/opening.json?limit=10&country=us&apikey=fqnm2a6cfkchp955v9a3m7st")
      return response.body
    end
  end

  class Movie
    attr_reader :title, :rating, :synopsis, :image
    def initialize(args)
      @title = args["title"]
      @rating = args["ratings"]["audience_score"]#######  rating: {audience_score: value} need to access nested hash
      @synopsis = args["synopsis"]
      @image = args["posters"]["thumbnail"]
    end

    def short_synopsis
       short = @synopsis.slice(0,150) 
       return  short + "..."
    end
  end
end