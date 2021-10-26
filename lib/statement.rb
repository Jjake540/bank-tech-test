# frozen_string_literal: true

# main statement class
class Statement
  HEADER = "date || credit || debit || balance\n"

  def timestamp
    Time.now.strftime('%d/%m/%Y')
  end

  def display_header
    HEADER
  end
end
