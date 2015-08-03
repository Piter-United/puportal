class CommunityDecorator < Draper::Decorator
  include MD

  delegate :name

  def members_count
    object.members.count
  end

  def link(options = {})
    action = options.delete(:action)
    options[:title] ||= object.name

    case action
    when :index
      index_link options
    when :join
      join_link options
    when :live
      live_link options
    when nil
      h.link_to options[:title], h.polymorphic_url([object]), options
    else
      h.link_to options[:title], h.polymorphic_url([object], action: action), options
    end
  end

  def index_link(options = {})
    path = h.polymorphic_url(object.class)
    h.link_to options[:title], path, options
  end

  def join_link(options = {})
    path = h.community_membership_path(community_id: object.id)
    h.link_to options[:title], path, options.merge(method: :post)
  end

  def live_link(options = {})
    path = h.community_membership_path(community_id: object.id)
    h.link_to options[:title], path, options.merge(method: :delete)
  end

  def description
    markdown.render(object.description).html_safe
  end

  def card
    h.image_tag object.logo.card.url, class: "circle responsive-img",
                                      "data-at2x" => object.logo.retina_card
  end
end
