# typed: true

module Blog::Views
  class Index < Phlex::HTML
    def view_template
      render Layout.new(title: 'Home', show_home: false) do
        img(src: '/avatar.jpg', class: 'avatar')
        h1 { Blog::DB.author_name }

        Blog::DB.posts.each do |post|
          a(class: 'post-preview', href: "/p/#{post.slug}") {
            h2 { post.title }
            p(class: 'smallcaps') { Blog::Helpers.format_date(post.published_on) }
            p { post.summary }
          }
        end

        a(class: 'smallcaps center', href: '/p/new', style: 'padding: 20px') { "Publish" }
      end
    end
  end
end
