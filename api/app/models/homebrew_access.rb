class HomebrewAccess < ApplicationRecord
  belongs_to :character
  belongs_to :source, as: :sourceable, polymorphic: true
end
