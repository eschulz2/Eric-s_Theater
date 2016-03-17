class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :showing_id
      t.string :name
      t.string :email
      t.integer :cc_num
      t.string :cc_exp

      t.timestamps null: false
    end
  end
end
