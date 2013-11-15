require_relative "../models/user"

class UsersController < RailsLite::ControllerBase
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params["user"])

    if @user.save
      redirect_to "/users/#{@user.id}"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def edit
  end

  def update
    render_content params.to_s, "text/text"
  end
end
