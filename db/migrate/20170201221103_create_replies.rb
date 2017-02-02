class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.string :username
      t.integer :post_id
      t.text :content

      t.timestamps
    end
  end
end
