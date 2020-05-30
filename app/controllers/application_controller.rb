class ApplicationController < ActionController::Base
  include ApplicationHelper

  def auth_required
    redirect_to '/auth/google_oauth2' unless authenticated?
  end
end
