#This class grabs heroes from the our api 
class Show
    attr_accessor :name, :summary, :genres

    @@all = []

    def initialize(name, summary, genres)
        @name = name
        @summary = summary
        @genres = genres
        save
    end

    def save
        @@all << self
    end 

    def self.all
        @@all
    end 
end 