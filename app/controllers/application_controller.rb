class ApplicationController < ActionController::Base
  protected

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    admin_path
  end
end
