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

            expect(page).to have_content('Calories')
            expect(page).to have_content('96')

            expect(page).to have_content('Fat')
            expect(page).to have_content('0.2')

            expect(page).to have_content('Sugar')
            expect(page).to have_content('17.2')

            expect(page).to have_content('Carbohydrates')
            expect(page).to have_content('22')

            expect(page).to have_content('Protein')
            expect(page).to have_content('1')

        end

        it 'link to fruits with similar nutritional value' do
            visit root_path
            fill_in 'search', with: 'Banana'
            click_on 'Search'

            expect(current_path).to eq(fruits_path)
            click_on 'Find Similar Fruits by Nutrition Value'

            expect(current_path).to eq(nutritional_fruits_path)
            expect(page).to have_content('Fruits with similar calories as Banana')

            expect(page).to have_content('Apple')
        end

        it 'similar fruits link to fruit by name' do
            visit root_path
            fill_in 'search', with: 'Banana'
            click_on 'Search'

            expect(current_path).to eq(fruits_path)
            click_on 'Find Similar Fruits by Nutrition Value'

            expect(current_path).to eq(nutritional_fruits_path)
            click_on 'Green Apple'

            expect(current_path).to eq(fruits_path)
            expect(page).to have_content('Name: Green Apple')
            expect(page).to have_content('Family: Rosaceae')
            expect(page).to have_content('Order: Rosales')
            expect(page).to have_content('Genus: Malus')
            expect(page).to have_content('Nutrition value:')

            expect(page).to have_content('Calories')
            expect(page).to have_content('21')

            expect(page).to have_content('Fat')
            expect(page).to have_content('0.1')

            expect(page).to have_content('Sugar')
            expect(page).to have_content('6.4')

            expect(page).to have_content('Carbohydrates')
            expect(page).to have_content('3.1')

            expect(page).to have_content('Protein')
            expect(page).to have_content('0.4')
        end
    end
end