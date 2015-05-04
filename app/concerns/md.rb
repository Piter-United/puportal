module MD
  extend ActiveSupport::Concern

  private

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true, filter_html: true)
  end

end