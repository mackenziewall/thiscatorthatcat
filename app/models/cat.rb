class Cat < ActiveRecord::Base
has_attached_file :picture, :default_url => "/images/normal/missing.png"
attr_accessor :picture_file_name
attr_accessor :picture_content_type
attr_accessor :picture_file_size
attr_accessor :picture_updated_at

validates_presence_of :picture


def self.top_cat
	order("yesvotes desc").limit(1).first
end

def self.two_random_cats
	find(:all, :limit => 2, :order =>  "RANDOM()")

	end 

end
