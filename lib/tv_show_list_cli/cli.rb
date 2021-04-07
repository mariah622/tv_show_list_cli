class CLI

    def start
        puts "Welcome! We are TV shows. What is your name?"
        input = user_input
        greet(input)
    end
    
    def user_input
        gets.strip.capitalize!
    end 

    def greet(name)
        puts "Hey there #{name}! Let's get started! Will you like to see some TV shows?. Enter Y to see more shows, or enter exit to exit."
        menu 
    end 

    def menu
        selection = user_input
        if selection == "Y"
            print_shows
            menu
        elsif selection == "Exit"
            goodbye
        else 
            invalid 
        end
    end 


    def goodbye
        puts "Thanks for participating!"
    end 

    def invalid
        puts "invalid response. Try again."
        menu
    end
    
    def print_shows
    
        shows =["show1", "show2", "show3"]
        shows.each.with_index(1) do |show, index|
            puts "#{index}. #{show}"
        end 
        select_show 
    end 

    def select_show
        puts "Please enter a number from the list to learn more about that Tv show."
        selection = user_input
        show_details(selection) 
        
    end

    def show_details(show)
        puts "#{show}"
        menu
    end 
          
end
