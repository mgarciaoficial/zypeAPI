class ApplicationController < ActionController::Base

  protected

  def paginate_collection(collection)
    Kaminari::PaginatableArray.new(collection, ApiRecord.paginate(collection))
  end
end
