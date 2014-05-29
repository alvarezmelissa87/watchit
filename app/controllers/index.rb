get '/' do
  api = HackerNews::Client.new
  erb :index
end