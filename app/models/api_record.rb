class ApiRecord < ActiveResource::Base
  self.site = 'https://api.zype.com'
  add_response_method :zype_response

  API_KEY = Rails.application.credentials[:api_key] || ENV['API_KEY']
  
  class << self  
    def instantiate_collection(collection, original_params = {}, prefix_options = {})
      collection = collection['response'] || collection
      super(collection, original_params, prefix_options)
    end
    
    def paginate(collection)
      params = pagination_params(collection)
      {
        limit: params['per_page'].to_i,
        offset: params['current'].to_i * params['per_page'].to_i - 1,
        total_count: (params['pages'].to_i * params['per_page'].to_i)
      }
    end

    protected

    def query_string(options)
      options = {} if options.nil?
      options[:app_key] = API_KEY

      super(options)
    end

    def pagination_params(collection)
      JSON.parse(collection.zype_response.body)
          .fetch('pagination')
          .slice('current', 'per_page', 'pages')
    end
  end
end