require "rails_helper"

RSpec.describe SubRacesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/sub_races").to route_to("sub_races#index")
    end

    it "routes to #show" do
      expect(get: "/sub_races/1").to route_to("sub_races#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/sub_races").to route_to("sub_races#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/sub_races/1").to route_to("sub_races#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/sub_races/1").to route_to("sub_races#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/sub_races/1").to route_to("sub_races#destroy", id: "1")
    end
  end
end
