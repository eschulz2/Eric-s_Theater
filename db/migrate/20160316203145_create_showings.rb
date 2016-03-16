class CreateShowings < ActiveRecord::Migration
  def change
    create_table :showings do |t|
      t.string :title
      t.datetime :time
      t.integer :seat_count
      t.integer :auditorium

      t.timestamps null: false
    end
  end
end
