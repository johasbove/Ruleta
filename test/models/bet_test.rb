# == Schema Information
#
# Table name: bets
#
#  id         :integer          not null, primary key
#  amount     :decimal(, )
#  bet_color  :integer
#  payout     :decimal(, )
#  round_id   :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer
#

require 'test_helper'

class BetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
