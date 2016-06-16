# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  name       :string
#  lastname   :string
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  money      :decimal(, )      default(10000.0)
#  status     :integer
#

class Player < ActiveRecord::Base
  has_many :bets
end
