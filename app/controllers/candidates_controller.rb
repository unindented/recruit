class CandidatesController < ApplicationController

  respond_to :html, :json

  before_filter :graph_entities, only: :new

  def new
    @candidate = Candidate.new
  end

  def create
    role = Role.find_by_id(params[:candidate].delete(:role_id))
    @candidate = Candidate.new(candidate_params)
    @candidate.role = role

    if @candidate.save
      flash[:notice] = t(:success, scope: [:candidates, :create])
    else
      flash[:alert] = t(:error, scope: [:candidates, :create])
    end

    respond_with @candidate, location: root_url
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :email, :comments)
  end

  def graph_entities
    @roles      = Role.enabled
    @candidates = Candidate.all

    gon.push({
      roles:      @roles,
      candidates: @candidates
    })
  end

end
