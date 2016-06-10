class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.text :content
      t.string :name

      t.timestamps
    end
  end
end
