require 'rails_helper'

RSpec.describe ApplicationController do
  it { is_expected.to rescue_from(Exception).with(:render_500) }
  it { is_expected.to rescue_from(ActiveRecord::RecordNotFound).with(:render_404) }
  it { is_expected.to rescue_from(ActionController::RoutingError).with(:render_404) }
  it { is_expected.to rescue_from(CanCan::AccessDenied).with(:render_403) }
end