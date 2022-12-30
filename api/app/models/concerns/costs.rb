module Costs
  extend ActiveSupport::Concern

  included do
    enum cost_unit: {
      'cp' => 0,
      'sp' => 1,
      'ep' => 2,
      'gp' => 3,
      'pp' => 4
    }

    COST_VALUES = {
      'cp' => 1,
      'sp' => 10,
      'ep' => 50,
      'gp' => 100,
      'pp' => 1000
    }.freeze

    UNITS_NAMES = {
      'cp' => 'Copper piece',
      'sp' => 'Silver piece',
      'ep' => 'Electrum piece',
      'gp' => 'Gold piece',
      'pp' => 'Platinum piece'
    }.freeze
  end

  def cost
    "#{cost_qtd} #{cost_unit}"
  end

  def cost_readable
    "#{ActionController::Base.helpers.number_to_currency(cost_qtd)} #{UNITS_NAMES[cost_unit].pluralize(cost_qtd)}"
    
  end
  

  def cost_h
    { qtd: cost_qtd, unit: cost_unit }
  end

  def convert_cost(unit)
    ActionController::Base.helpers.number_to_human(cost_h[:qtd] * COST_VALUES[cost_h[:unit]].to_f / COST_VALUES[unit])
  end

  def convert_cost_to(unit)
    { qtd: convert_cost(unit), unit: }
  end

  def convert_cost!(unit)
    update(
      cost_qtd: convert_cost(unit),
      cost_unit: unit
    )
  end
end
