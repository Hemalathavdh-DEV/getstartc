class Quote < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :Enter_your_quote, presence: true,
								 length: {minimum: 5, maximum: 2000}
	validates :Email, presence: true
end
