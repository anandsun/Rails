class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :user
      t.string :keywords
      t.boolean: :searchTopic
      t.boolean: :searchMessage
      t.boolean :searchUser
      t.timestamps
    end
  end
end
