class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.float :score, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
