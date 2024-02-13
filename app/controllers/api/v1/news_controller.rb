class Api::V1::NewsController < ApplicationController
  def index
    news_data = NewsApiService.fetch_technology_news
    render json: news_data
  end
end
