class Review < ActiveRecord::Base
  belongs_to :airport

  validates :airport, presence: true
  validates :rating, numericality: { only_integers: true }, inclusion: { in: (1..5) }
end
