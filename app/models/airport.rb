class Airport < ActiveRecord::Base
  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
