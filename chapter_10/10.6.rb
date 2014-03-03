# Prime Printer
class PrimePrinter

  NUMBER_OF_PRIMES = 1000
  ROWS_PER_PAGE = 50 
  COLUMNS_PER_PAGE = 4

  def initialize
    @primes = Primes.new.generate(NUMBER_OF_PRIMES)
    @table_printer = RowColumnPagePrinter.new(ROWS_PER_PAGE, COLUMNS_PER_PAGE,
                        "The First " + NUMBER_OF_PRIMES + " Prime Numbers")
  end

  def print(primes)
    @table_printer.print(primes)
  end
end