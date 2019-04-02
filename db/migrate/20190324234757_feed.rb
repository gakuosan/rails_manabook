class Feed < ActiveRecord::Migration[5.1]
  def change
      t.string :title
      t.text :image
      t.text :content

      t.timestamps
  end
end
