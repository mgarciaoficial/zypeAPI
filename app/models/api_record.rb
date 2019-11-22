class ApiRecord < ActiveResource::Base
  self.site = 'https://api.zype.com'
  add_response_method :zype_response
  
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
      options[:app_key] = 'XWny5j0V89yb1uZu6SI_D95EADV5FzBYldE9Ny0_q0GOzcWLiruPyhN-f2Pcyohf'

      super(options)
    end

    def pagination_params(collection)
      JSON.parse(collection.zype_response.body)
          .fetch('pagination')
          .slice('current', 'per_page', 'pages')
    end
  end
end