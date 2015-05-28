class PageController < ApplicationController
  respond_to :html, :js
  def index
    if params[:q]
      @classifieds = Classified.where("content @@ :query", query: params[:q]).order(created_at: :DESC)
    else
      @classifieds = Classified.order(created_at: :DESC)
    end
    @classifieds = Classified.order(created_at: :DESC) if params[:q].nil? || params[:q].empty?

  end
end
