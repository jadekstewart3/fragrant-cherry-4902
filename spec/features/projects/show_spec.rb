require 'rails_helper'
RSpec.describe type: :feature do 
  context "As a visitor" do 
    context "When I visit the Project show page" do 
      before(:each) do 
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
        @phil = Contestant.create(name: "Phil DeFraties", age: 37, hometown: "Denver", years_of_experience: 20)
        @boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
        ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
        visit project_path(@boardfit.id)
      end

      it "displays the project name" do 
        expect(page).to have_content(@boardfit.name)
      end

      it "displays the project material" do 
        expect(page).to have_content("Material:")
        expect(page).to have_content(@boardfit.material)
      end

      it "displays the challenge theme for the project" do 
        expect(page).to have_content("Challenge Theme:")
        expect(page).to have_content(@boardfit.challenge.theme)
      end

      it "displays the number of contestants working on the project" do
        expect(page).to have_content("Number of Contestants:")
        expect(page).to have_content("Number of Contestants:\n1")
      end

      it "has a form to add a contestant to the project" do 
        expect(page).to have_field(:contestant_id)
        expect(page).to have_button("Add Contestant to Project")
      end

      it "adds a contestant to the project when the form is filled out" do 
        select @phil.name, from: :contestant_id
        click_button "Add Contestant to Project"

        expect(page).to have_content("Number of Contestants:\n2")
      end
    end
  end
end