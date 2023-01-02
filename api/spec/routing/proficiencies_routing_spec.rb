require "rails_helper"

RSpec.describe ProficienciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/proficiencies").to route_to("proficiencies#index")
    end

    it "routes to #show" do
      expect(get: "/proficiencies/1").to route_to("proficiencies#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/proficiencies").to route_to("proficiencies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/proficiencies/1").to route_to("proficiencies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/proficiencies/1").to route_to("proficiencies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/proficiencies/1").to route_to("proficiencies#destroy", id: "1")
    end
  end
end
