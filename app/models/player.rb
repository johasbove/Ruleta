# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  name       :string
#  lastname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  money      :decimal(, )      default(10000.0)
#  status     :integer          default(0)
#

class Player < ActiveRecord::Base
  STATUSES = [:available, :busy]
  enum status: STATUSES

  before_save :normalize

  has_many :bets
  
  validates :name, presence: true

  def full_name
    [self.name, self.lastname].join(" ")
  end

  def generate_bet round
    decision = Random.rand(100.0)
    bet = Bet.create(player: self, round: round)
    case decision
    when 0..49
      bet.bet_color = 1
    when 49..88
      bet.bet_color = 2
    when 88..100
      bet.bet_color = 3
    end
    if money > 1000
      amount_percentage = Random.rand(0.08..0.15)
      bet.amount = money.amount_percentage
    elsif money > 0
      bet.amount = money
    else
      bet.amount = 0
    end

    bet.save
  end

  def normalize
    self.name.upcase!
    self.lastname.upcase!
  end
end

