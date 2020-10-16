class HomeController < ApplicationController

    def index 
    end

    def show
        table = Scraper.run('new-jersey', 'cocaine')
        render json: table.possession 
    end
    
end