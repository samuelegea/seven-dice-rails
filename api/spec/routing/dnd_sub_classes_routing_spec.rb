require "rails_helper"

RSpec.describe DndSubClassesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/dnd_sub_classes").to route_to("dnd_sub_classes#index")
    end

    it "routes to #show" do
      expect(get: "/dnd_sub_classes/1").to route_to("dnd_sub_classes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/dnd_sub_classes").to route_to("dnd_sub_classes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/dnd_sub_classes/1").to route_to("dnd_sub_classes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/dnd_sub_classes/1").to route_to("dnd_sub_classes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/dnd_sub_classes/1").to route_to("dnd_sub_classes#destroy", id: "1")
    end
  end
end
