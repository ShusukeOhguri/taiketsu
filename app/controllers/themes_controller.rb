class ThemesController < ApplicationController
  def index
    @new_theme = Theme.new
  end

  def create
    @new_theme = Theme.new(create_params)
    if @new_theme.save
      redirect_to theme_path, notice: "お題の作成に成功しました"
    else
      redirect_to root_path, alert:"お題の作成に失敗しました"
    end
  end

  def show
  end

  private
    def create_params
      params.require(:theme).permit(:red, :blue).merge(user_id: current_user.id)
    end
end
