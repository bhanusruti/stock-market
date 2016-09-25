class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  # POST for search
  def search
    searchterm = params[:search]
    searchterm = searchterm.upcase
    
    exact_match = Company.find_by(company_code: searchterm)
    if exact_match
      redirect_to "/companies/#{exact_match.id}"
    else
      # @stock = StockQuote::Stock.quote(searchterm)
      redirect_to "/search?searchterm=#{searchterm}"
    end

  end

  # GET page for search results
  def search_results
    searchterm = params[:searchterm]
    @companies = Company.search(searchterm)

  end

  def show
    @company = Company.find(params[:id])
    @stock = StockQuote::Stock.quote(@company.company_code)

    @buy_votes = Vote.where(company_id: @company.id, choice: "buy").length
    @sell_votes = Vote.where(company_id: @company.id, choice: "sell").length
    @hold_votes = Vote.where(company_id: @company.id, choice: "hold").length

   
    @get_quotes = api_call("https://sandbox.tradier.com/v1/markets/quotes?symbols=#{@company.company_code}")
    @get_time_and_sales = api_call("https://sandbox.tradier.com/v1/markets/timesales?symbol=#{@company.company_code}")

    @company_votes = Vote.where(company_id: @company.id).group(:choice).count
    @companies = Company.group_by_hour_of_day(:created_at, format: "%-l %P").count
    query = %(http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20IN%20(%22#{@company.company_code}%22)&format=json&env=http://datatables.org/alltables.env)
    @company_info = Unirest.get(query).body
    puts @company_info

    # Votes from 5 days ago for choice buy
    @five_day_buy_votes = Vote.where(created_at: 5.day.ago, choice: "buy").count
    @five_day_buy_votes = Vote.where(created_at: 4.day.ago, choice: "buy").count
    @five_day_buy_votes = Vote.where(created_at: 3.day.ago, choice: "buy").count
    @five_day_buy_votes = Vote.where(created_at: 2.day.ago, choice: "buy").count
    @five_day_buy_votes = Vote.where(created_at: 1.day.ago, choice: "buy").count

    # votes from 5 days ago for choice sell
    @five_day_sell_votes = Vote.where(created_at: 5.day.ago, choice: "sell").count
    @five_day_sell_votes = Vote.where(created_at: 4.day.ago, choice: "sell").count
    @five_day_sell_votes = Vote.where(created_at: 3.day.ago, choice: "sell").count
    @five_day_sell_votes = Vote.where(created_at: 2.day.ago, choice: "sell").count
    @five_day_sell_votes = Vote.where(created_at: 1.day.ago, choice: "sell").count

    # votes from 5 days ago for choice hold
    @five_day_hold_votes = Vote.where(created_at: 5.day.ago, choice: "hold").count
    @five_day_hold_votes = Vote.where(created_at: 4.day.ago, choice: "hold").count
    @five_day_hold_votes = Vote.where(created_at: 3.day.ago, choice: "hold").count
    @five_day_hold_votes = Vote.where(created_at: 2.day.ago, choice: "hold").count
    @five_day_hold_votes = Vote.where(created_at: 1.day.ago, choice: "hold").count
    
    
  end

  private

  def api_call(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.read_timeout = 30
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    request = Net::HTTP::Get.new(uri.request_uri)

    # Headers

    request["Accept"] = "application/json"
    request["Authorization"] = "Bearer CJThu9KoRgUAk7yA8UggFBALVi6Y"

    # Send synchronously

    response = http.request(request)
    return JSON.parse(response.body)
  end




end
