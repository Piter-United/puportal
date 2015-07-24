xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Piter United"
    xml.description "Piter United description"
    xml.link events_url

    for event in Event.current_week
      xml.item do
        xml.title event.title
        xml.description event.description
        xml.pubDate event.created_at.to_s(:rfc822)
        xml.link event_url(event)
        xml.guid event_url(event)
      end
    end
  end
end