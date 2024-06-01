class FruitsController < ApplicationController
    def index
    binding.pry    
    end

    def create
        # Call the service
        @fruit = FruityViceService.search_by_name(params[:search])
        binding.pry
        # then maybe create a fruit model



        render :index
    end
end