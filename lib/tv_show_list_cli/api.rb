#Application Program Tnterface
#This class only grabs information from the api and nothing else
class API
    def self.get_data
        response = RestClient.get("http://api.tvmaze.com/shows")
        list = JSON.parse(response)
        list.each do |name_list|
            Show.new(name_list["name"], name_list["summary"], name_list["genres"])

        end 
            
        
    end

end 

