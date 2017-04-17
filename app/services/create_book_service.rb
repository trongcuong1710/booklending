class CreateBookService
	def create(book)
		yield(book.errors.full_messages) unless book.valid?
		book.save
		yield(nil)
	end
end