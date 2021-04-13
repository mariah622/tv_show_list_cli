#This class grabs heroes from the our api 
class Show
    attr_accessor :name, :summary, :genres

    @@all = []

    def initialize(show_hash)
        show_hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        save
    end

    def save
        @@all << self
    end 

    def self.all
        @@all
    end
    
    def self.find_by_selection(show_name)
        self.all.detect do |show|
            show.name.downcase == show_name.downcase
        end 
    end 
end 