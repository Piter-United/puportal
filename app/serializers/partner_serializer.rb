class PartnerSerializer < ActiveModel::Serializer
  attributes :name, :url, :logo, :status

  def logo
    object.logo.url
  end
end
