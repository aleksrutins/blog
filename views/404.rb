# typed: true

module Blog::Views
  class NotFound < Phlex::HTML
    def view_template
      render Layout.new(title: 'Not Found', show_home: true) do
        h1 { "Not Found" }
      end
    end
  end
end
