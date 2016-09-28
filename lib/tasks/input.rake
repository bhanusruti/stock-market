require 'csv'

namespace :input do
  desc "To retrieve company and ticker data"
  task get_tickers: :environment do
    # count = 0
    CSV.foreach("nasdaq.csv") do |row|
      # next if count == 0
      Company.create(company_code: row[0], company_name: row[1])
      puts "add company #{row[1]} to database"
      # count += 1
    end
  end
end
