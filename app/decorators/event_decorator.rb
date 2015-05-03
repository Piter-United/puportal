class EventDecorator < Draper::Decorator
  include MD

  delegate :start, :title, :location

  decorates_association :community

  def description
    markdown.render(object.description).html_safe
  end

  def link(options = {})
    action = options.delete(:action)
    link_title = options.delete(:title) || object.title
    link_url = nil

    case
    when action == :index
      link_url = h.polymorphic_url(object.class)
    when action.nil?
      link_url = h.polymorphic_url([object])
    else
      link_url = h.polymorphic_url([object], { action: action })
    end

    h.link_to link_title, link_url, options
  end

  def date
    h.l object.date, format: :short
  end

  def time
    [start, finish].compact.join(" – ")
  end

  def tags
    object.tags.join(',')
  end

  def datetime
    [date, time].join(" ")
  end

  def start
    h.l object.start, format: :time
  end

  def finish
    h.l object.finish, format: :time
  end

end