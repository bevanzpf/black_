class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :work, index: true
      t.text :body
      t.timestamps null: false
    end
  end
end
