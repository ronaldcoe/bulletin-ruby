class RemoveDateCreatedFromLikes < ActiveRecord::Migration[7.1]
  def change
    remove_column :likes, :date_created, :datetime
  end
end
