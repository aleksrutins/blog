# typed: true
require 'roda'
require 'kramdown'
require 'redis'
require 'phlex'
require 'sorbet-runtime'
require 'json'

class Module
  include T::Sig
end
module Blog end

require_relative 'util/helpers'
require_relative 'util/db'
require_relative 'views/layout'
require_relative 'views/index'
require_relative 'views/404'
require_relative 'views/post'
require_relative 'views/publish'

class Blog::App < Roda
  plugin :public

  route do |r|
    r.root do
      Blog::Views::Index.new.call
    end

    r.on 'p' do
      r.is 'new' do
        r.get do
          Blog::Views::Publish.new.call
        end
        r.post do
          return 'Unauthorized' unless r.params['token'] == Blog::DB.publish_token

          Blog::DB.update_post(r.params['slug'], Blog::DB::Post.from_hash(
            r.params.merge(
              "published_on" => Date.today.to_s,
            )
          ))

          r.redirect '/'
        end
      end

      r.get String do |slug|
        Blog::Views::Post.new(post: Blog::DB.post(slug)).call
      end
    end

    r.public
  end
end
