class ThemesController < ApplicationController

  before_action :new_theme, only: [:index, :show]

  def index
    @sort_popularity_themes = "ASC"
    @paginate_popularity_themes = 12
    @popularity_themes = Kaminari.paginate_array(choise_theme(@sort_popularity_themes)).page(params[:page]).per(@paginate_popularity_themes)
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
    @new_opinion = Opinion.new
  end

  private
    def create_params
      params.require(:theme).permit(:red, :blue).merge(user_id: current_user.id)
    end

    def new_theme
      @sort_recruiting_opinions_themes = "DESC"
      @paginate_recruiting_opinions_themes = 6
      @recruiting_opinions_themes = choise_theme(@sort_recruiting_opinions_themes).take(@paginate_recruiting_opinions_themes)
      @new_theme = Theme.new
    end

    def choise_theme(sort)
      choise_themes = []
      Theme.ids.each do |theme|
        choise_themes << {id:theme, opinion:Theme.find(theme).opinions.count}
      end
      if sort == "ASC"
        sorted_themes = choise_themes.sort{|a, b| b[:opinion] <=> a[:opinion]}
      elsif sort == "DESC"
        sorted_themes = choise_themes.sort{|a, b| a[:opinion] <=> b[:opinion]}
      end
        count_color(sorted_themes)
    end

    def count_color(sorted_themes)
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
