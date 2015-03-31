class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id, :answer_id, :author_id

      t.timestamps
    end
  end
end
