require_relative './controllers/drinks_controller'
require_relative './controllers/categories_controller'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  set :views, './app/views'
  set :public_folder, './public'

  get '/' do
    redirect '/drinks'
  end
end

