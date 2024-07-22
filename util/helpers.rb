# typed: true

module Blog::Helpers
  sig { params(date: String).returns(String) }
  def self.format_date(date)
    Date.parse(date).to_s
  end
end
