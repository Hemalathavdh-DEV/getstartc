class UserMailer < ApplicationMailer
	default from: 'hemalathavdh@gmail.com'

	def practice_email
		@quotes = params[:quote]
		@url = "http://www.gmail.com"
		mail(to: @quotes.Email, subject: "Created Successfully")
	end

	def destroy_email
		@quotes = params[:quote]
		@url = "https://www.gmail.com"
		mail(to: @quotes.Email, subject: "Regarding deletion activity")
	end

	def update_email
		@quotes = params[:quote]
		@url = "https://www.gmail.com"
		mail(to: @quotes.Email, subject: "Regarding update activity")
	end

end
