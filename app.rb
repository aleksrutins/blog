require 'sinatra'
require 'kramdown'
require 'redis'

helpers do
  def format_date(date)
    Date.parse(date).to_s
  end
end

redis = Redis.new(url: ENV['REDIS_URL'])

set :haml, {escape_html: false}

get '/' do
  haml :index, locals: {
    title: 'Home',
    show_home: false,
    author_name: redis.get('author_name'),
    posts: redis.keys('post:*').map {|key| JSON.parse(redis.get(key)).merge(id: key.split(':').last) }
  }
end

get '/p/new' do
  haml :publish, locals: {title: 'Publish', show_home: true}
end

post '/p/new' do
  return 'Unauthorized' unless params[:token] == redis.get('publish_token')

  redis.set("post:#{params[:slug]}",
            params.slice(:title, :published_on, :summary, :body)
            .merge(
              published_on: Date.today.to_s,
            ).to_json)
  redirect '/'
end

get '/p/:post' do
  post = JSON.parse(redis.get("post:#{params[:post]}"))
  haml :post, locals: post.merge(show_home: true)
end