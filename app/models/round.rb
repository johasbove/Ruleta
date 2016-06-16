# == Schema Information
#
# Table name: rounds
#
#  id           :integer          not null, primary key
#  total_bet    :float
#  spin_result  :integer
#  total_payout :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Round < ActiveRecord::Base
  has_many :bets
end
