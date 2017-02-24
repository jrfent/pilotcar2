class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :prepare_meta_tags, if: "request.get?"
  
  def page_not_found
      respond_to do |format|
        format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
        format.all  { render nothing: true, status: 404 }
      end
  end

    def prepare_meta_tags(options={})

      site_name   = "Pilot Car Finder"
      title       = [controller_name, action_name].join(" ")
      description = "Pilot Car Finders is the fast and easy way to find pilot cars and oversized load escorts"
      image       = options[:image] || "https://s3.amazonaws.com/pilotcar/pilotcarfinders.png"
      current_url = request.url

      # Let's prepare a nice set of defaults

      defaults = {
        site:        site_name,
        title:       title, reverse: true,
        image:       image,
        description: description,
        keywords:    %w[pilot car pilotcar wide-load escort oversize-load],
        twitter:     {site_name: site_name,
                      site: '@pilotcarfinder',
                      card: 'summary',
                      description: description,
                      image: image},
        og:          {url: current_url,
                      site_name: site_name,
                      title: title,
                      image: image,
                      description: description,
                      type: 'website'}
      }

      options.reverse_merge!(defaults)

      set_meta_tags options
    end

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:address_line1, :address_line2, :city, :state, :zipcode, :contact_name, :contact_phone, :company, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
    }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
end