class AbstractProposalController < ApplicationController

  def set_proposal
    @proposal = Proposal.find(params[:proposal_id])
  end
end
