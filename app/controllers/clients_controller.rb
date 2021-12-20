class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index 
        clients = Client.all 
        render json: clients 
    end 
    
    def show
        client = Client.find(params[:id])
        render json: client 
    end 

private 
    def record_not_found(exception)
        render json: { error:  "#{exception.model} not found " }, status: :not_found
    end

end
