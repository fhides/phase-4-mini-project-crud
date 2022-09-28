class SpicesController < ApplicationController
def index
        spices = Spice.all
        render json: spices
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end


    def update
        spice = find_params
        if spice
            spice.update(spice_params)
            render json: spice
        else
            error_msg
        end
    end

    def destroy
        spice = find_params
        if spice
            spice.destroy
            head :no_content
        else
            error_msg
        end
    end

    private 
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def error_msg
        render json: {error: "Spice not found"}, status: :not_found
    end

    def find_params
        Spice.find_by(id: params[:id])
    end
end
