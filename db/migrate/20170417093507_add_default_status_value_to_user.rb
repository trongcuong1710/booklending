class AddDefaultStatusValueToUser < ActiveRecord::Migration[5.0]
  def change
  	change_column_default(:books, :status, 'available')
  end
end
