#coding: utf-8
class HelloController < ApplicationController
	def index
		render text: 'こんにちは世界'
	end

	def view
		@message = 'こんにちは世界２'
	end

	def list
		@books = Book.all
	end

end
