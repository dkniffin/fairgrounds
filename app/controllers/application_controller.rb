class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def credits; end

  def admin; end
end
