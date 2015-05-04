module MD
  extend ActiveSupport::Concern

  private

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, markdown_options)
  end

  def markdown_options
    { autolink: true, tables: true, filter_html: true }
  end
end
