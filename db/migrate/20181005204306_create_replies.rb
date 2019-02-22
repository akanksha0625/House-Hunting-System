class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.string :body
      t.references :inquiry, foreign_key: true

      t.timestamps
    end
  end
end
