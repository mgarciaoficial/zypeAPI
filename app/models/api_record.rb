class ApiRecord < ActiveResource::Base
  self.site = 'https://api.zype.com'
  add_response_method :zype_api
  
  class << self  
    def instantiate_collection(collection, original_params = {}, prefix_options = {})
      collection = collection['response'] || collection
      super(collection, original_params, prefix_options)
    end
    
    protected

    def query_string(options)
      options = {} if options.nil?
      options[:app_key] = 'XWny5j0V89yb1uZu6SI_D95EADV5FzBYldE9Ny0_q0GOzcWLiruPyhN-f2Pcyohf'

      super(options)
    end
  end
end