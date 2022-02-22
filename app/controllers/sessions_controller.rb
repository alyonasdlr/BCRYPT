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
            session["user_id"] = user.id
            redirect_to "companies"
    else
        #password doesnt match, redirect to login page
        flash[:notice] = "Password is incorrect"
        redirect_to "/sessions/new"
    end
end

def destroy
    session["user_id"] = nil
    flash[:notice] = "You have been logged out"
    redirect_to "/sessions/new"
end

end
