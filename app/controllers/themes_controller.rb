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
    @opinions = @theme.opinions
    @user_id = current_user.id
    @new_opinion = Opinion.new
  end

  private
    def create_params
      params.require(:theme).permit(:red, :blue).merge(user_id: @user_id)
    end

    def new_theme
      @new_theme = Theme.new
      @popularity_themes = choise_theme(0, 12)
      @recruiting_opinions_themes = choise_theme(1, 6)
    end

    def choise_theme(sort, cnt_lmt)
      choise_themes = []
      Theme.ids.each do |theme|
        choise_themes << {id:theme, opinion:Theme.find(theme).opinions.count}
      end

      if sort == 0
        sorted_themes = choise_themes.sort{|a, b| b[:opinion] <=> a[:opinion]}.take(cnt_lmt)
      elsif sort == 1
        sorted_themes = choise_themes.sort{|a, b| a[:opinion] <=> b[:opinion]}.take(cnt_lmt)
      end

      chosen_themes = []
      sorted_themes.each do |theme|
        cnt_red = 0
        cnt_blue = 0
        opinions = Theme.find(theme[:id]).opinions
        opinions.each do |opinion|
          if opinion[:side] == 0
            cnt_red += 1
          elsif opinion[:side] == 1
            cnt_blue += 1
          end
        end
        theme[:red] = cnt_red
        theme[:blue] = cnt_blue
        chosen_themes << theme
      end
      return chosen_themes
    end
end
