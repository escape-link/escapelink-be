class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection

  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  after_action :set_csrf_cookie, unless: -> { request.format.json? }

  private

  def set_csrf_cookie
    cookies['X-CSRF-Token'] = form_authenticity_token
  end
end
