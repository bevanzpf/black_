class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :subject
      t.string :picture
      t.text :desc
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
