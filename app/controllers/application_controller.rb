class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html.haml", :status => 403, :layout => false
    ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
    ## this render call should be:
    # render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end 

  private

  # AngularJS automatically sends CSRF token as a header called X-XSRF
  # this makes sure rails gets it
  def verified_request?
    !protect_against_forgery? || request.get? ||
      form_authenticity_token == params[request_forgery_protection_token] ||
      form_authenticity_token == request.headers['X-XSRF-Token']
  end
 end
