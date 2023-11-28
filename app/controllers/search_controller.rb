class SearchController < ApplicationController
  def search
    @query = params[:query]
    @category = params[:collection]

    if @query.blank?
      flash[:alert] = "Please enter a toy's name."
      redirect_to search_path
    else
      if @category.blank?
        @results = Toy.where("full_name LIKE ?", "%#{sanitize_sql_like(@query)}%")

        if @results.empty?
          flash[:notice] = "No results found."
        end
      else
        @results = Toy.where("full_name LIKE ?", "%#{sanitize_sql_like(@query)}%").where("collection_id LIKE ?", "%#{@category["id"]}%")

        if @results.empty?
          flash[:notice] = "No results found."
        end
      end
    end
  end

  private

  def sanitize_sql_like(str)
    ActiveRecord::Base.sanitize_sql_like(str)
  end
end
