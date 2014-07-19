class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :trip, index: true
      t.string :site
      t.text :description

      t.timestamps
    end
  end
end
