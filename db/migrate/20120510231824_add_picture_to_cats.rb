class AddPictureToCats < ActiveRecord::Migration
  def change
  	add_column :cats, :picture_file_name,  		:string
	add_column :cats, :picture_content_type, 	:string
	add_column :cats, :picture_file_size, 		:integer
	add_column :cats, :picture_updated_at, 		:datetime
  end
end