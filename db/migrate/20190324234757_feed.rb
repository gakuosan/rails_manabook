class Feed < ActiveRecord::Migration[5.1]
  def change
      reate_table :feeds do |t|
      t.string :title
      t.text :image
      t.text :content
      
      t.timestamps
  end
  end
end