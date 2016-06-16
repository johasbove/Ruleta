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
#

class Bet < ActiveRecord::Base
  belongs_to :round
  belongs_to :player
end
