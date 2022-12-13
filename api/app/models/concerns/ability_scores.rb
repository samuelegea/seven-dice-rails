module AbilityScores
  extend ActiveSupport::Concern

  included do
    enum ability_scores: [
      :charisma,
      :constitution,
      :dexterety,
      :intelligence,
      :strength,
      :wisdom
    ]
  end
end
