class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :email, :limit => 100, :presence => true
    	t.string :password, :limit => 100, :presence => true
    	t.string :password_digest

    	t.timestamps
    end
  end
end
