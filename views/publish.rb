# typed: true

module Blog::Views
  class Publish < Phlex::HTML
    def view_template
      render Layout.new(title: 'Publish', show_home: true) do
        h1 { "Publish" }

        form(method: 'post') {
          input(name: 'token', placeholder: 'Publish Token')
          input(name: 'title', placeholder: 'Title')
          input(name: 'slug', placeholder: 'Slug')
          input(name: 'summary', placeholder: 'Summary')
          br
          textarea(name: 'body')
          br
          button(type: 'submit') { "Publish" }
        }
      end
    end
  end
end
