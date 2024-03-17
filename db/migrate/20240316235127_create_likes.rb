class CreateLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :likes do |t|
      t.datetime :date_created
      t.references :user, null: false, foreign_key: true
      t.references :discussion_thread, null: false, foreign_key: true

      t.timestamps
    end
  end
end
