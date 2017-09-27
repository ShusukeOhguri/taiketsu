class OpinionsController < ApplicationController
    before_action :get_theme_info, only: [:index, :create]

  def index
  end

  def create
    @new_opinion = Opinion.new(create_params)
    if @new_opinion.save
      redirect_to theme_path(@new_opinion.theme_id), notice: "意見の作成に成功しました"
    else
      redirect_to :back, alert:"意見の作成に失敗しました"
    end
  end

  private
    def get_theme_info
      @theme = Theme.find(params[:theme_id])
    end

    def create_params
      params.require(:opinion).permit(:text, :side).merge(user_id: current_user.id, theme_id: @theme.id)
    end
end
