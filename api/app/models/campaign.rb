class Campaign < ApplicationRecord
  belongs_to :created_by
  belongs_to :dmed_by
end
