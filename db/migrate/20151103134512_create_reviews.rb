class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :widget, index: true, foreign_key: true
      t.string :author
      t.integer :stars
      t.text :message

      t.timestamps null: false
    end
  end
end
