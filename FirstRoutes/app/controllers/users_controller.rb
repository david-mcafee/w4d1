require 'byebug'

class UsersController < ApplicationController
  def index
    user = User.all
    render json: user
  end

#   def create_user(name, email)
#   url = Addressable::URI.new(
#     scheme: 'http',
#     host: 'localhost',
#     port: 3000,
#     path: '/users.json'
#   ).to_s
#
#   puts RestClient.post(
#     url,
#     { user: { name: name, email: email } }
#   )
# end
#
# create_user("Gizmo", "gizmo@gizmo.gizmo")

  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    # debugger
    user = User.find(params[:id])
    if user
      render json: user
    else
      render(
        json: user.errors.full_messages
      )
    end
  end

  def update
    user = User.find(params[:id])
    if user
      render json: user
    else
      render(
        json: user.errors.full_messages
      )
    end
  end

  def destroy
    user = User.find(params[:id])
    if user
      render json: user
    else
      render(
        json: user.errors.full_messages
      )
    end
  end


end
