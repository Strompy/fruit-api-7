class FruitsController < ApplicationController
    def index
    binding.pry    
    end

    def create
        @fruit = {}

        render :index
    end
end