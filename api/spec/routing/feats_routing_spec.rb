require "rails_helper"

RSpec.describe FeatsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/feats").to route_to("feats#index")
    end

    it "routes to #show" do
      expect(get: "/feats/1").to route_to("feats#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/feats").to route_to("feats#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/feats/1").to route_to("feats#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/feats/1").to route_to("feats#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/feats/1").to route_to("feats#destroy", id: "1")
    end
  end
end
