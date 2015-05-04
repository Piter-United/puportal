module EmbeddedAttribute
  extend ActiveSupport::Concern

  def embedded_attributes
    @embedded_attributes ||= {}
  end

  def embedded(atrribute, struct)
    embedded_attributes[atrribute] = struct

    serialize atrribute, struct

    struct.members.each { |member| delegate member, to: atrribute }
  end

end
