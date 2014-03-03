class RowColumnPagePrinter

  def initialize(rows_per_page, columns_per_page, page_header)
    @rows_per_page = rows_per_page
    @columns_per_page = columns_per_page
    @page_header = page_header
  end

  def self.rows_per_page
  end

  def self.columns_per_page
  end

  def self.page_header
  end

  def nummbers_per_page
    @rows_per_page * @columns_per_page
  end

  def print_stream
    p "#{stream}"
  end

  def print(first_index_on_page, last_index_on_page, data)
    page_number = 1

    while first_index_on_page < data.length
      last_index_on_page = (first_index_on_page + nummbers_per_page - 1, data.length - 1).min 
      print_page_header(page_header, page_number)
      pring_page(first_index_on_page, last_index_on_page, data)
      first_index_on_page += 1
    end
  end

  def print_page(first_index_on_page, last_index_on_page,data)
    first_index_of_last_row_on_page = first_index_on_page + rows_per_page - 1

    while first_index_in_row <= first_index_of_last_row_on_page 
      print_row(first_index_in_row, last_index_on_page, data)
      first_index_in_row += 1
    end
  end

  def print_row(first_index_in_row, last_index_on_page, data)
    while column < columns_per_page
      index = first_index_in_row + column * rows_per_page if index <= last_index_on_page
      p "%10d"
      p data[index]
      column += 1
    end
  end

  def print_page_header(page_header, page_number)
    print_stream.print_line("#{page_header} --- Page #{page_number}")
  end

  def set_output(print_stream)
    self.print_stream
  end
end