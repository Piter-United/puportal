module ArrayAttributes
  extend ActiveSupport::Concern

  DEFAULT_SEPARATOR = ",".freeze

  def array_attribute(name, options = {})
    separator = options.fetch(:separator, DEFAULT_SEPARATOR)

    define_method "#{ name }=" do |value|
      if value.is_a?(Array)
        super value.flatten
      else
        super value.to_s.split(separator)
      end
    end
  end
end
