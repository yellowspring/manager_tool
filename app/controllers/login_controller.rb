class LoginController < ApplicationController
  skip_before_filter :require_login

  def new
  	session[:user] = nil
    session[:last_seen] = nil
  end
 
  def check
        name = params[:username]
        passwd = params[:password]
        if authenticate(name, passwd) && ! User.find(:all, :conditions => ["name=?", params[:username] ] ).empty?
            session[:user] = name
            session[:last_seen] = Time.now
            if session['return-to'].nil?
                    redirect_to  clients_path()
            else
                redirect_to session['return-to']
            end
        else
            session[:user] = nil
            redirect_to "/login/new"
        end
    end

    def authenticate(name, passwd)
            result = `"#{Rails.root}"/public/scripts/login_rpam.rb "#{name}" "#{passwd}" `
            #result = `/home/mlemailtracking/rails_apps/etrack_web/public/scripts/login_rpam.rb "#{name}" "#{passwd}" `
	    if result.include?("SUCCESS")
	        return true
	    else
	        return false
	    end
    end
end

