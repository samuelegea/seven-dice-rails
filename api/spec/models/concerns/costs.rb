require 'test_helper'

class CostsTest < ActiveSupport::TestCase
  test "costs enum contains expected values" do
    assert_equal({ 'cp' => 0, 'sp' => 1, 'ep' => 2, 'gp' => 3, 'pp' => 4 }, Costs.cost_units)
  end

  test "COST_VALUES contains expected values" do
    assert_equal({ 'cp' => 1, 'sp' => 10, 'ep' => 50, 'gp' => 100, 'pp' => 1000 }, Costs::COST_VALUES)
  end

  test "UNITS_NAMES contains expected values" do
    assert_equal({ 'cp' => 'Copper piece', 'sp' => 'Silver piece', 'ep' => 'Electrum piece', 'gp' => 'Gold piece', 'pp' => 'Platinum piece' }, Costs::UNITS_NAMES)
  end

  test "cost returns expected result" do
    assert_equal(Costs.new.cost(10, 0), "10 Copper pieces")
  end

  test "cost_h returns expected result" do
    assert_equal(Costs.new.cost_h, { qtd: 0, unit: 0 })
  end

  test "convert_cost returns expected result" do
    assert_equal(Costs.new.cost(1, 0).convert_cost(4), "1000 Platinum pieces")
  end

  test "convert_cost_to returns expected result" do
    assert_equal(Costs.new.convert_cost_to(4), { qtd: 1000, unit: 4 })
  end

  test "convert_cost! updates cost_qtd and cost_unit" do
    cost = Costs.new
    cost.convert_cost!(4)
    assert_equal(cost.cost_qtd, 1000)
    assert_equal(cost.cost_unit, 4)
  end
end
