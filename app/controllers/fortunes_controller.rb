class FortunesController < ApplicationController
  
  respond_to :html, :json

  def show
    fortune = FortuneText.new params

    respond_to do |format|
      format.html { render text: fortune }
      format.json { respond_with fortune }
    end
  end
end
