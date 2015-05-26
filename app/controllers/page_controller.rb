class PageController < ApplicationController
  respond_to :html, :js
  def index
    if params[:q]
      @classifieds = Classified.where("content @@ :query", query: params[:q])
    else
      @classifieds = Classified.order(created_at: :ASC)
    end
    @classifieds = Classified.order(created_at: :ASC) if params[:q].nil? || params[:q].empty?

  end
end
