require "rails_helper"

RSpec.describe EquipmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/equipments").to route_to("equipments#index")
    end

    it "routes to #show" do
      expect(get: "/equipments/1").to route_to("equipments#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/equipments").to route_to("equipments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/equipments/1").to route_to("equipments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/equipments/1").to route_to("equipments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/equipments/1").to route_to("equipments#destroy", id: "1")
    end
  end
end
