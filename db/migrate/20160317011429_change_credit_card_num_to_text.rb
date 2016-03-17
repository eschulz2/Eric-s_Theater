class ChangeCreditCardNumToText < ActiveRecord::Migration
  def change
  	change_column :tickets, :cc_num, :string
  end
end
