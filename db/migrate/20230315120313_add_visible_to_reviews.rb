class AddVisibleToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :visible, :boolean, default: true
  end

end
