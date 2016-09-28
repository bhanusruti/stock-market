class PagesController < ApplicationController

  def welcome
  end

  def home
    # @companies = Company.all.sample(10)

    # Companies to show on home page
    company_codes = ["AAPL", "AXP", "BAC", "COF", "DAL", "ETN"]
    @companies = []
    company_codes.each do |code|
      @companies << Company.find_by(company_code: code)
    end

  end
end
