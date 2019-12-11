class CSV
  class Table
    def to_tsv(write_headers: true, **options)
      array = write_headers ? [headers.to_csv(options)] : []
      @table.each do |row|
        array.push(row.fields.to_csv(options)) unless row.header_row?
      end

      array.join("")
    end
  end
end
