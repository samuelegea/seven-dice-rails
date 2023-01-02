require "rails_helper"

RSpec.describe TraitsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/traits").to route_to("traits#index")
    end

    it "routes to #show" do
      expect(get: "/traits/1").to route_to("traits#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/traits").to route_to("traits#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/traits/1").to route_to("traits#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/traits/1").to route_to("traits#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/traits/1").to route_to("traits#destroy", id: "1")
    end
  end
end
