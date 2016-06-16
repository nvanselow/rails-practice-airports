class AddTimestampsToReviews < ActiveRecord::Migration
  def change
    add_timestamps(:reviews, null: false)
  end
end
