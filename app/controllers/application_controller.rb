class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

	private

	  def require_login
	    unless ! session[:user].nil?
	      redirect_to :controller => "login", :action => "new"
	    end
	  end
end
