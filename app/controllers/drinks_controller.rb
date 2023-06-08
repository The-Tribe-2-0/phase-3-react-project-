require_relative '../models/drink'

class DrinksController < ApplicationController
  # Get all drinks
  get '/drinks' do
    @drinks = Drink.all
    json @drinks
  end

  # Get a specific drink
  get '/drinks/:id' do
    @drink = Drink.find(params[:id])
    json @drink
  end

  # Create a new drink
  post '/drinks' do
    @drink = Drink.new(params)
    if @drink.save
      json @drink
    else
      status 400
      json error: 'Failed to create drink'
    end
  end

  # Update a drink
  put '/drinks/:id' do
    @drink = Drink.find(params[:id])
    if @drink.update(params)
      json @drink
    else
      status 400
      json error: 'Failed to update drink'
    end
  end

  # Delete a drink
  delete '/drinks/:id' do
    @drink = Drink.find(params[:id])
    if @drink.destroy
      json message: 'Drink successfully deleted'
    else
      status 400
      json error: 'Failed to delete drink'
    end
  end
end
