class User < ActiveRecord::Base
    has_many :drinks
    has_many :categories
  end
  