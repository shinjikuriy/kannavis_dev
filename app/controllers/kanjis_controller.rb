class KanjisController < ApplicationController
  def show
    @kanji = Kanji.find_by!(grapheme: params[:grapheme])
  end
end
