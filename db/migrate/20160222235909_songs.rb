class Songs < ActiveRecord::Migration
  def change
  	create_table :songs do |t|
  		t.string :name
  		t.string :artist
  		t.string :url
  		t.timestamps
  	end
  end
end
