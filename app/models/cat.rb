class Cat < ActiveRecord::Base
has_attached_file :picture, :default_url => "/images/normal/missing.png"
attr_accessible :image, :yesvotes, :totalvotes, :picture

validates_presence_of :picture


def self.top_cat
	order("yesvotes desc").limit(1).first
end

  def self.ugliest_cat
    Cat.all.reduce({}) do |acc, cat|
      percentage = cat.totalvotes / cat.yesvotes
      acc[percentage] = cat
      acc
    end.sort do |cat1, cat2|
      if cat1[0] > cat2[0]
        1
      else
        -1
      end
    end.last[1]
  end

def self.two_random_cats
	find(:all, :limit => 2, :order =>  "RANDOM()")

	end

end
