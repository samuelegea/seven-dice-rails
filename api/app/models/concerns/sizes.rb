module Sizes
  extend ActiveSupport::Concern

  included do
    enum size: [
      :tiny,
      :small,
      :medium,
      :large,
      :huge,
      :gargantuan
    ]

    def squares_ocupied
      SQUARES_OCCUPIED[size]
    end

    def hit_dice
      HIT_DICE[size]
    end
  end

  SQUARES_OCCUPIED = {
    tiny: 0.5,
    small: 1,
    medium: 1,
    large: 10,
    huge: 15,
    gargantuan: 20
  }.freeze

  HIT_DICE = {
    tiny: '1d4',
    small: '1d6',
    medium: '1d8',
    large: '1d10',
    huge: '1d12',
    gargantuan: '1d20'
  }.freeze
end
