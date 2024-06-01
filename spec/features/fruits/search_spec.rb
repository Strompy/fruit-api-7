require 'rails_helper'

RSpec.describe "/fruits", type: :feature do
    describe 'search' do
        it 'fruit by name' do
            visit root_path
            fill_in 'search', with: 'Banana'
            click_on 'Search'
            
            expect(current_path).to eq(fruits_path)
            expect(page).to have_content('Name: Banana')
            expect(page).to have_content('Family: Musaceae')
            expect(page).to have_content('Order: Zingiberales')
            expect(page).to have_content('Genus: Musa')
            expect(page).to have_content('Nutrition value:')
            expect(page).to have_content('Calories: 96')
            expect(page).to have_content('Fat: 0.2')
            expect(page).to have_content('Sugar: 17.2')
            expect(page).to have_content('Carbohydrates: 22')
            expect(page).to have_content('Protein: 1')
        end
    end
end