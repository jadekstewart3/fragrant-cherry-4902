require "rails_helper"

RSpec.describe Project, type: :model do

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "instance methods" do 
    before(:each) do 
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      @news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

      ContestantProject.create(contestant_id: jay.id, project_id: @news_chic.id)
      ContestantProject.create(contestant_id: gretchen.id, project_id: @news_chic.id)
    end

    describe "contestant_count" do 
      it "returns the number of contestants working on a project" do 
        expect(@news_chic.contestant_count).to eq(2)
      end
    end

    describe "average_years_of_contestant_experience" do 
      it "returns the average years of experience for all contestants on a project" do 
        expect(@news_chic.average_years_of_contestant_experience).to eq(12.5)
      end
    end
  end
end
