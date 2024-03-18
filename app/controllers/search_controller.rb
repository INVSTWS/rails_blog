class SearchController < ApplicationController
  def index
    @query = Post.ransack(params[:q])
    @posts = @query.result(distinct: true) # distinct - unique data
  end
end
