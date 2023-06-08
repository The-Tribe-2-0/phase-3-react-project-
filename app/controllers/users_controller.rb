require_relative '../models/user'

class UsersController < ApplicationController
  # Get all users
  get '/users' do
    @users = User.all
    json @users
  end

  # Get a specific user
  get '/users/:id' do
    @user = User.find(params[:id])
    json @user
  end

  # Create a new user
  post '/users' do
    @user = User.new(params)
    if @user.save
      json @user
    else
      status 400
      json error: 'Failed to create user'
    end
  end

  # Update a user
  put '/users/:id' do
    @user = User.find(params[:id])
    if @user.update(params)
      json @user
    else
      status 400
      json error: 'Failed to update user'
    end
  end

  # Delete a user
  delete '/users/:id' do
    @user = User.find(params[:id])
    if @user.destroy
      json message: 'User successfully deleted'
    else
      status 400
      json error: 'Failed to delete user'
    end
  end
end
