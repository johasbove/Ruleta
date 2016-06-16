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
  STATUSES = ["active", "inactive"]
  enum status: STATUSES

  has_many :bets
  
  validates :name, presence: true

  private

  def generate_bet
    
  end
end
