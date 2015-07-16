class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Exception,                      with: :render_500
  rescue_from ActiveRecord::RecordNotFound,   with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from CanCan::AccessDenied,           with: :render_403

  def render_403
    render text: "Access denied", head: 403
  end

  def render_404
    render text: "Page not found", head: 404
  end

  def render_500(exception)
    fail exception if Rails.env.development? || Rails.env.test?
    Bugsnag.notify(exception) if defined?(Bugsnag)
    render text: "Server error", status: 500
  end
end
