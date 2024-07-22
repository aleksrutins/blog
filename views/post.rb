# typed: true

module Blog::Views
  class Post < Phlex::HTML
    sig { params(post: Blog::DB::Post).void }
    def initialize(post:)
      @post = post
    end

    def view_template
      render Layout.new(title: @post.title, show_home: true) do
        h1 { @post.title }
        p(class: 'smallcaps center') { Date.parse(@post.published_on).to_s }

        article {
          unsafe_raw T.cast(Kramdown::Document.new(@post.body), T.untyped).to_html
        }
      end
    end
  end
end
