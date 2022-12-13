module Alignments
  extend ActiveSupport::Concern

  included do
    enum alignment: [
      :lawful_good,
      :lawful_neutral,
      :lawful_evil,
      :neutral_good,
      :true_neutral,
      :neutral_evil,
      :evil_good,
      :evil_neutral,
      :evil_evil
    ]
  end
end
