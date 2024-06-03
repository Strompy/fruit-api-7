class FruitsController < ApplicationController
    before_action :search_fruit, only: [:index, :create]

    def index; end

    def create
        render :index
    end

    def nutritional
        @fruit_name = params[:name]
        @fruits = FruityViceService.search_by_calories(params[:nutritions][:calories])
        @fruits.delete_if { |fruit| fruit[:name] == @fruit_name }
    end

    private

    def search_fruit
        @fruit = FruityViceService.search_by_name(params[:search]) if params[:search]
    end
end