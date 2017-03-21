class BooksController < ApplicationController
	before_action :admin_authentication_required!
	
	def index
	end
end