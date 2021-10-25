class Statement

  HEADER = "date || credit || debit || balance\n"

  def timestamp
    Time.now.strftime("%d/%m/%Y")
  end

  def display
    print HEADER
  end

end