module RollDice
  extend ActiveSupport::Concern

  # Rolls a number of dices  
  # expected
  # roll_dices('1d6') => 4
  # roll_dices('3d6') => [4,3,5]
  # roll_dices(['1d10', '3d6']) => [[3], [4,2,6]]

  def roll_dices(rolls)
    raise StandardError unless rolls.is_a?(Array || String)

    if rolls.is_a? Array
      rolls.map do |r|
        roll = roll_same_type_dice(r)
        roll if roll.is_a? Array
        [roll] if roll.is_a? Integer
      end

      return rolls
    end

    roll_same_type_dice(rolls)
  end

  private

  def roll_same_type_dice(roll)
    qtd, dice = roll.split('d').map(&:to_i)
    return rand(1..dice) if qtd == 1

    (1..qtd).to_a.map do
      rand(dice) + 1
    end
  end
end
