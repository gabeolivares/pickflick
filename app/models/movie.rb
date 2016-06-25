class Movie < ActiveRecord::Base
validates :genre, presence: true
validates :title, presence: true
validates :actors, presence: true
validates :year, presence: true
validates :rating, presence: true

def self.search(search, search_params)
  where("#{search_params} LIKE ?", "%#{search}%")
end

end
