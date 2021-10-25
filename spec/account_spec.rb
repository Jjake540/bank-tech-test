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

end