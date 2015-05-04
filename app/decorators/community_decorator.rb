class CommunityDecorator < Draper::Decorator
  include MD

  delegate :name

  def link(options = {})
    action = options.delete(:action)
    link_title = options.delete(:title) || object.name
    link_url = nil

    case
    when action == :index
      link_url = h.polymorphic_url(object.class)
    when action.nil?
      link_url = h.polymorphic_url([object])
    else
      link_url = h.polymorphic_url([object], action: action)
    end

    h.link_to link_title, link_url, options
  end

  def description
    markdown.render(object.description).html_safe
  end

  def thumb
    h.image_tag object.logo.thumb.url, class: "circle responsive-img"
  end

  def logo
    h.image_tag object.logo.url
  end
end
