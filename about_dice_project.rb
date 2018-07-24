require File.expand_path(File.dirname(__FILE__) + '/neo')

# You need to write the code for the DiceSet class below

class DiceSet
  attr_reader :values
  def roll(total_number_of_rolls)
    @values = total_number_of_rolls.times.map{ Random.rand(6) + 1 }
  end
end

class AboutDiceProject < Neo::Koan
  def test_can_create_a_dice_set
    dice = DiceSet.new
    assert_not_nil dice
  end

  def test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
    dice = DiceSet.new

    dice.roll(5)
    assert dice.values.is_a?(Array)
    assert_equal 5, dice.values.size
    dice.values.each do |value|
      assert value >= 1 && value <= 6
    end
  end

  def test_dice_values_should_change_between_rolls
    dice = DiceSet.new

    dice.roll(5)
    first_turn = dice.values

    dice.roll(5)
    second_turn = dice.values

    assert_not_equal first_turn, second_turn

    # Chrissy's note: The values array is changed if and only if you call .roll

    # THINK ABOUT IT:
    # It is extremely unlikely that the five rolls from the first turn will equal the five rolls
    # of the second turn.  Here we are assuming that they are not going to be equal and testing that.
  end

  def test_dice_values_do_not_change_unless_explicitly_rolled
    dice = DiceSet.new
    dice.roll(5)
    first_turn = dice.values
    second_turn = dice.values
    assert_equal first_turn, second_turn
  end

  def test_you_can_roll_different_numbers_of_dice
    dice = DiceSet.new

    dice.roll(3)
    assert_equal 3, dice.values.size

    dice.roll(1)
    assert_equal 1, dice.values.size
  end

end
