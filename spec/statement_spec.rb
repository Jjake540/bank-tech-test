require 'statement'

MOCK_HEADER = "date || credit || debit || balance\n"

describe Statement do

  it 'saves the date of when a transaction was made' do
    statement = Statement.new
    timestamp = Time.now.strftime('%d/%m/%Y')
    expect(statement.timestamp).to eq(timestamp)
  end

  describe 'display' do
    it 'should display the bank statement header' do
      statement = Statement.new
      expect { statement.display }.to output(MOCK_HEADER).to_stdout
    end
  end


  
end