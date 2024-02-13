class NewsApiService
  include HTTParty
  base_uri 'https://newsapi.org/v2'

  def self.fetch_technology_news
    api_key = ENV['NEWS_API_KEY']
    api_url = "/top-headlines?country=jp&category=technology&apiKey=#{api_key}"
    response = get(api_url)
    if response.success?
      JSON.parse(response.body)
    else
      nil
    end
  end
end
