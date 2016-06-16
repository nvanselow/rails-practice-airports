class Airport < ActiveRecord::Base
  has_many :reviews
  
  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
