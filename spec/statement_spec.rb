# frozen_string_literal: true

require 'statement'

MOCK_HEADER = "date || credit || debit || balance\n"

describe Statement do
  let(:statement) { Statement.new }
  it 'saves the date of when a transaction was made' do
    timestamp = Time.now.strftime('%d/%m/%Y')
    expect(statement.timestamp).to eq(timestamp)
  end

  describe 'display' do
    it 'should display the bank statement header' do
      expect(statement.display_header).to eq(MOCK_HEADER)
    end
  end
end
