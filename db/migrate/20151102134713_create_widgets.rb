class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :color, null: false
      t.boolean :shipped, null: false, default: false

      t.datetime :created_at, null: false
    end
  end
end
