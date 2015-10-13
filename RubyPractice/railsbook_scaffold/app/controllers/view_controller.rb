class ViewController < ApplicationController
	def form_for
		@book = Book.new
	end
end
