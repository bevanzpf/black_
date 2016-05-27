class AddLikesAcountToWorks < ActiveRecord::Migration
  def change
    add_column :works, :likes_count, :integer, default: 0
  end
end
