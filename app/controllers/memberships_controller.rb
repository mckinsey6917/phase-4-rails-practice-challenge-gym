class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index 
        memberships = Membership.all
        render json: memberships
    end

    def show 
        membership = Membership.find(params[:id])
        render json: membership 
    end

    def create 
        membership = Membership.create!(create_params)
        render json: membership, status: :created
    end

private

    def record_not_found(exception)
        render json: { error: "#{exception.model} not found" }, status: :not_found
    end 

    def record_invalid(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
    
    def create_params
        params.permit(:gym_id, :client_id, :charge)
    end
end
