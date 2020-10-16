class HomeController < ApplicationController
    skip_before_action :verify_authenticity_token  
    def index 
    end

    def create
        drug = params[:drug].downcase
        puts drug
        state = params[:state].downcase.split(' ').join('-')
        charge = params[:charge].downcase
        table = Scraper.run(state, drug)
        render json: table.possession 
    end
    
end