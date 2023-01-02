require "rails_helper"

RSpec.describe HomebrewAccessesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/homebrew_accesses").to route_to("homebrew_accesses#index")
    end

    it "routes to #show" do
      expect(get: "/homebrew_accesses/1").to route_to("homebrew_accesses#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/homebrew_accesses").to route_to("homebrew_accesses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/homebrew_accesses/1").to route_to("homebrew_accesses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/homebrew_accesses/1").to route_to("homebrew_accesses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/homebrew_accesses/1").to route_to("homebrew_accesses#destroy", id: "1")
    end
  end
end
