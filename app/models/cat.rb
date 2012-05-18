class Cat < ActiveRecord::Base
has_attached_file :picture, :default_url => "/images/normal/missing.png"
attr_accessible :image, :yesvotes, :totalvotes, :picture

validates_presence_of :picture


def self.top_cat
	order("yesvotes desc").limit(1).first
end

def self.two_random_cats
	find(:all, :limit => 2, :order =>  "RANDOM()")

	end 

end
