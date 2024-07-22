# typed: true

module Blog::Views
  class Layout < Phlex::HTML
    sig { params(title: String, show_home: T::Boolean).void }
    def initialize(title:, show_home:)
      @title = title
      @show_home = show_home
    end

    def view_template(&content) = html {
      head {
        title { @title }
        meta(charset: 'utf-8')
        meta(name: 'viewport', content: 'width=device-width, initial-scale=1.0')
        link(rel: 'stylesheet', href: '/app.css')
      }
      body {
        main {
          a(class: 'smallcaps center', href: '/') { "All Posts" } if @show_home

          yield content
        }
      }
    }
  end
end
