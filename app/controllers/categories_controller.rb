require_relative '../models/category'

class CategoriesController < ApplicationController
  # Get all categories
  get '/categories' do
    @categories = Category.all
    json @categories
  end

  # Get a specific category
  get '/categories/:id' do
    @category = Category.find(params[:id])
    json @category
  end

  # Create a new category
  post '/categories' do
    @category = Category.new(params)
    if @category.save
      json @category
    else
      status 400
      json error: 'Failed to create category'
    end
  end

  # Update a category
  put '/categories/:id' do
    @category = Category.find(params[:id])
    if @category.update(params)
      json @category
    else
      status 400
      json error: 'Failed to update category'
    end
  end

  # Delete a category
  delete '/categories/:id' do
    @category = Category.find(params[:id])
    if @category.destroy
      json message: 'Category successfully deleted'
    else
      status 400
      json error: 'Failed to delete category'
    end
  end
end
