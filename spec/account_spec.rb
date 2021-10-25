require 'account'

describe Account do

  it 'account starts with a balance of 0' do
    account = Account.new
    expect(account.balance).to eq(0)
  end

  it 'can deposit money into the account' do
    account = Account.new
    account.deposit(100)
    expect(account.balance).to eq(100)
  end

  it 'can withdraw money from the account' do
    account = Account.new
    account.deposit(100)
    account.withdraw(50)
    expect(account.balance).to eq(50)
  end
  
  describe 'transactions' do
    it 'stores a transaction after a deposit' do
      account = Account.new
      account.deposit(50)
      account.deposit(100)
      account.deposit(150)
      expect(account.transactions.length).to eq(3)
    end

    it 'stores a transaction after a withdraw' do
      account = Account.new
      account.withdraw(50)
      account.withdraw(50)
      expect(account.transactions.length).to eq(2)
    end

    it 'transaction updates with balance' do
      account = Account.new
      account.deposit(50)
      expect(account.transactions[0]['balance']).to eq(50)
    end

    it 'transaction updates with date' do
      account = Account.new
      account.deposit(50)
      date = Statement.new.timestamp
      expect(account.transactions[0]['date']).to eq(date)
    end
  end

end