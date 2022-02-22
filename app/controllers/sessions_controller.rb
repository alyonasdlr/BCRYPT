class SessionsController < ApplicationController
def new
end


def create
    entered_email = params["email"]
    entered_password = password_matches["[password"]
    @user = User.find_by({email: entered_email})
    #when you expect exactly one value, either a unser with one email or nothing
    if @user
        #check the password
        if BCrypt::Password.new(@user.password) ==entered_password
            redirect_to "companies"
    else
        #password doesnt match, redirect to login page
        redirect_to "/sessions/new"
    end
end


end
