class AssessmentsController < ApplicationController
  def create
    @vote_assessment = Assessment.new(create_params)
    if @vote_assessment.save
      redirect_to theme_path(params[:theme_id]), notice: "評価しました"
    else
      redirect_to :back, alert:"同じ意見を何度も評価できません"
    end
  end

  private
    def create_params
      params.require(:assessment).permit(:like).merge(user_id: current_user.id, opinion_id: params[:opinion_id])
    end
end
