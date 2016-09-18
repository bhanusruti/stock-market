class VotesController < ApplicationController

  def create
    vote = Vote.new 
    vote.choice = params[:vote]
    vote.company_id = params[:company]
    vote.user_id = current_user.id

    previous_vote = Vote.where(company_id: vote.company_id, user_id: vote.user_id).first
    if previous_vote
      previous_vote.update_attribute(:choice, params[:vote])
    else
      vote.save
    end
      
    redirect_to "/companies/#{params[:company]}"
  end

end
