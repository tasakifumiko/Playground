class AddAreaIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :area_id, :integer
  end
end
