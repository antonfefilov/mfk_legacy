module Admin
  class BaseController < BaseController
    layout 'admin'
  
    check_authorization

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to "/login", flash: { error: exception.message }
    end
  end
end
