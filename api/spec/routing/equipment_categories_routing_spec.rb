require "rails_helper"

RSpec.describe EquipmentCategoriesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/equipment_categories").to route_to("equipment_categories#index")
    end

    it "routes to #show" do
      expect(get: "/equipment_categories/1").to route_to("equipment_categories#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/equipment_categories").to route_to("equipment_categories#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/equipment_categories/1").to route_to("equipment_categories#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/equipment_categories/1").to route_to("equipment_categories#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/equipment_categories/1").to route_to("equipment_categories#destroy", id: "1")
    end
  end
end
