# typed: true

module Blog::DB
  class Post < T::Struct
    prop :slug, T.nilable(String)
    prop :title, String
    prop :published_on, String
    prop :summary, String
    prop :body, String
  end

  @redis = Redis.new(url: ENV['REDIS_URL'])

  sig { returns(String) }
  def self.author_name = @redis.get('author_name')

  sig { returns(String) }
  def self.publish_token = @redis.get('publish_token')

  sig { returns(T::Array[Post]) }
  def self.posts = @redis.keys('post:*')
    .map {|key| JSON.parse(@redis.get(key)).merge("slug" => key.split(':').last) }
    .map {|post| Post.from_hash(post)}
    .sort {|a, b| b.published_on <=> a.published_on }

  sig { params(slug: String).returns(Post) }
  def self.post(slug) = Post.from_hash(JSON.parse(@redis.get("post:#{slug}")))

  sig { params(slug: String, data: Post).void }
  def self.update_post(slug, data) = @redis.set("post:#{slug}", data.serialize.to_json)
end
