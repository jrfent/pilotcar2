# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_filter :authenticate_admin

    def authenticate_admin
      # TODO Add authentication logic here.
    end
    
    def index
         search_term = params[:search].to_s.strip
         resources = Administrate::Search.new(resource_resolver, search_term).run
         resources = order.apply(resources)
         resources = resources.paginate(:page => params[:page])     
         page = Administrate::Page::Collection.new(dashboard, order: order)

         render locals: {
           resources: resources.paginate(:page => params[:page]),
           search_term: search_term,
           page: page,
         }
       end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
