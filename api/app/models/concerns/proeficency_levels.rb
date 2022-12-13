module ProeficencyLevels
  extend ActiveSupport::Concern

  included do
    enum proeficency_level: [
      :untrained,
      :trained,
      :expert,
      :master,
      :legendary
    ]
  end
end
