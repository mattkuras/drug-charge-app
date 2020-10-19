class HomeController < ApplicationController
    skip_before_action :verify_authenticity_token  
    def index 
    end

    def create
        drug = params[:drug].downcase
        state = params[:state].downcase.split(' ').join('-')
        charge = params[:charge].downcase 
        puts charge 
        table = Scraper.run(state, drug)
        if charge == 'possession'
            charge = table.possession
            elsif charge == 'sale'
                charge = table.sale
                elsif charge == 'trafficking'
                    charge = table.trafficking
                end
        # elsif charge == 'Sale'
        #         render json: table.sale
        # elsif charge =='Trafficking'
        #         render json: table.trafficking
        # end
        render json: charge
    end
    
end