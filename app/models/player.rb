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
  STATUSES = [:available, :broke, :disabled]
  enum status: STATUSES

  before_save :normalize

  has_many :bets
  
  validates :name, presence: true

  def full_name
    [self.name, self.lastname].join(" ")
  end

  def generate_bet bet
    bet.player = self
    bet.bet_color = generate_bet_color
    bet.amount = generate_bet_amount
    if bet.save
      discount_money(bet.amount)
    else
      errors[:base] << "The bet couldn't be saved"
    end
  end

  private

  def generate_bet_color
    color_decision = Random.rand(100.0)
    case color_decision
    when 0..49 
      "red"
    when 49..88
      "black"
    when 88..100 
      "green"
    end
  end

  def generate_bet_amount
    money = self.money
    if money > 1000
      amount_percentage = Random.rand(0.08..0.15)
      money * amount_percentage
    elsif money > 0
      money      
    else
      0
    end
  end

  def discount_money amount
    self.money -= amount
    self.save
  end

  def normalize
    self.name.upcase!
    self.lastname.upcase!
  end
end

