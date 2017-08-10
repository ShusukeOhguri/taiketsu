class ThemesController < ApplicationController
  def index
    @new_theme = Theme.new
  end
end
