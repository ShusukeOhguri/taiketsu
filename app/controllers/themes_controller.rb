class ThemesController < ApplicationController
  before_action :new_theme, only: [:index, :show]

  def index
  end

  def create
    @new_theme = Theme.new(create_params)
    if @new_theme.save
      redirect_to theme_path(@new_theme.id), notice: "お題の作成に成功しました"
    else
      redirect_to :back, alert:"お題の作成に失敗しました"
    end
  end

  def show
    @theme = Theme.find(params[:id])
  end

  private
    def create_params
      params.require(:theme).permit(:red, :blue).merge(user_id: current_user.id)
    end

    def new_theme
      @new_theme = Theme.new
    end
end
