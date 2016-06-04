class AddIndexCreateAtToComments < ActiveRecord::Migration
  def change
    add_index :comments, :created_at
  end
end
