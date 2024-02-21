require "rails_helper"

RSpec.describe Contestant, type: :model do

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe "scopes" do 
    describe ".not_working_on_project" do
      before(:each) do 
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        @news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

        jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
        @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

        ContestantProject.create(contestant_id: jay.id, project_id: @news_chic.id)
        ContestantProject.create(contestant_id: gretchen.id, project_id: @news_chic.id)
      end
      
      it "returns an array of contestants not working on the project" do 
        expect(Contestant.not_working_on_project(@news_chic)).to eq([@kentaro])
      end
    end
  end
end
