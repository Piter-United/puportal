require 'devise'

module ControllerExamples
  def self.included(suite)
    suite.before :each do |example|
      if example.metadata[:authenticated].present?
        authenticated_scope = example.metadata[:authenticated]

        if respond_to? authenticated_scope
          authenticated_resource = send(authenticated_scope)
        else
          authenticated_resource = create(:user, :confirmed)
        end

        request.env["devise.mapping"] = Devise.mappings[authenticated_scope]
        sign_in authenticated_scope, authenticated_resource
      end
    end

    suite.before :each do |example|
      if example.metadata[:authorized]
        example.metadata[:authorized].each do |action, resource|
          allow_any_instance_of(Ability).to receive(:can?).with(action, resource).and_return(true)
        end
      end
    end
  end

  def process(action, http_method, parameters = {}, *args)
    super action, http_method, parameters.merge(format: 'json'), *args
  end

  def errors(errors={})
    ActiveModel::Errors.new(nil).tap do |instance|
      errors.each do |attribute, message|
        instance.add(attribute, message)
      end
    end
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include ControllerExamples,  type: :controller
end
