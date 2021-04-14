class API
    def self.get_data
        response = RestClient.get("http://api.tvmaze.com/shows")
        show_array = JSON.parse(response)
        show_array.each do |show|
            Show.new(show)
        end 
    end 
end 

