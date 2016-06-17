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
  # CUANDO UN JUGADOR ESTARIA OCUPADO SI JUEGAN AL MISMO TIEMPO?
  STATUSES = [:available, :broke, :disabled]
  enum status: STATUSES

  before_save :normalize

  has_many :bets
  
  validates :name, presence: true

  def full_name
    [self.name, self.lastname].join(" ")
  end

  def generate_bet round
    decision = Random.rand(100.0)
    puts "hhhhhhhhhhhhhhhh"
    bet = Bet.new(player: self, round: round)
    puts "bbbbbbbbbbbbbbbb"
    if decision < 49
      bet.red!
    elsif decision < 88
      bet.black!
    elsif decision < 100
      bet.green!
    end  
    # case decision
    #   when 0..49 then bet.red!
    #   when 49..88 then bet.black!
    #   when 88..100 then bet.green!
    # end
    puts "ccccccccccccccccccccccc"
    puts bet
    if self.money > 1000
      amount_percentage = Random.rand(0.08..0.15)
      bet.amount = self.money * amount_percentage
      puts "CASO 1"
      puts bet
    elsif self.money > 0
      bet.amount = self.money
      puts "CASO 2"
      puts bet
    else
      bet.amount = 0
      puts "CASO 3"
      puts bet
    end
    bet.save
  end

  def normalize
    self.name.upcase!
    self.lastname.upcase!
  end
end

