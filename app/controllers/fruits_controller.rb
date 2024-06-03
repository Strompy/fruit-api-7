class FruitsController < ApplicationController
    def index; end

    def create
        @fruit = FruityViceService.search_by_name(params[:search])

        render :index
    end

    def nutritional
        @fruit_name = params[:name]
        @fruits = FruityViceService.search_by_calories(params[:nutritions][:calories])
    end
end