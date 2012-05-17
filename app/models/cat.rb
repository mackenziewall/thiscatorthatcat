class Cat < ActiveRecord::Base
def self.top_cat
	order("yesvotes desc").limit(1).first
end

def self.two_random_cats
	find(:all, :limit => 2, :order =>  "RANDOM()")

	end 

end
