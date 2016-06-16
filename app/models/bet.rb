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
  COLORS = ["red", "black", "green"]
  enum bet_color: COLORS

  belongs_to :round
  belongs_to :player

  validates :amount, :bet_color, :round, :player, presence: true
  validates :round, :player, associated: true

end
