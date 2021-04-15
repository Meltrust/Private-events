class SessionsController < ApplicationController
    before_action :logged_in, only: :new

    def new 
    end
    
    def create
      user = User.find_by(name: params[:session][:name])
      if user
        login(user)
        redirect_to :user
      else
        render :new
      end
    end

    private

    def logged_in
      redirect_to current_user if logged_in?
    end
end
