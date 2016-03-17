class Ticket < ActiveRecord::Base
	belongs_to :showing

	validates :name, :cc_exp, presence: true, length: { minimum: 4, maximum: 20 }
	validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
	validates :cc_num, presence: true, length: { minimum: 6, maximum: 20 }
end
