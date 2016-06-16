class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :airport, null: false
      t.integer :rating, null: false
      t.text :body, null: false
    end
  end
end
