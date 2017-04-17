class CreateBooks < ActiveRecord::Migration[5.0]
  def change
		create_table :books do |t|
			t.string :title, :limit => 200, :presence => true
			t.string :author, :limit => 50, :presence => true
			t.string :summary
			t.string :status, :limit => 20, :presence => true
			t.string :borrower, :limit => 100
		end
  end
end