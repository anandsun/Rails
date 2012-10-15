class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.integer :user
      t.string :topic
      t.string :message

      t.timestamps
    end
  end
end
