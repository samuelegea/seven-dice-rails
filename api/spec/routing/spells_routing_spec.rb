require "rails_helper"

RSpec.describe SpellsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/spells.rb").to route_to("spells.rb#index")
    end

    it "routes to #show" do
      expect(get: "/spells.rb/1").to route_to("spells.rb#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/spells.rb").to route_to("spells.rb#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/spells.rb/1").to route_to("spells.rb#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/spells.rb/1").to route_to("spells.rb#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/spells.rb/1").to route_to("spells.rb#destroy", id: "1")
    end
  end
end
