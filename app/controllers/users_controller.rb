class UsersController < ApplicationController

  def show
    @user = User.find_by({ "id" => params["id"] })
  end

  def new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    # encrypt user's password before storing in database
    @user["password"] = BCrypt::Password.create(params["password"])
    @user.save
    redirect_to "/users/#{@user["id"]}"
  end
end
