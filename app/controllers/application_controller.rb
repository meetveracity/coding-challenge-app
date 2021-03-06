class ApplicationController < ActionController::Base
  include RouteHelper
  before_action :setup_gon
  rescue_from Exception, java.lang.Throwable, :with => :internal_error

  def internal_error(exception)
    $log.error{LEX("An unhandled exception occurred!", exception)}
  end

  def setup_gon
    gon.routes = setup_routes
    gon.packs = packed_assets
    gon.user = ""
  end
end
