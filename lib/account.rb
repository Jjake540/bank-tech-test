require_relative 'statement'

class Account
  
  attr_reader :balance
  attr_reader :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions.push({"debit" => '   ', "credit" => amount, "balance" => @balance, "date" => date})
  end

  def withdraw(amount)
    @balance -= amount
    @transactions.push({"debit" => amount, "credit" => '   ', "balance" => @balance, "date" => date})
  end

private

  def date
    Statement.new.timestamp
  end
  
end