class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :url, index:true, unique:true
      t.string :title
      t.string :author
      t.references :user, index: true
      t.text :description
      t.date :published_on

      #t.timestamps
    end
  end
end
