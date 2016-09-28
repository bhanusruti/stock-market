class Company < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  has_many :followings



  def self.search(search)
    where("lower(company_name) LIKE ? OR lower(company_code) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%") 
  end

end
