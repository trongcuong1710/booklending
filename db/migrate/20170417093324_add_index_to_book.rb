class AddIndexToBook < ActiveRecord::Migration[5.0]
  def change
  	add_index(:books, :title)
  end
end
