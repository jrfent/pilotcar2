require "administrate/base_dashboard"

class ListingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    category: Field::BelongsTo,
    subcategory: Field::BelongsTo,
    pilot: Field::BelongsTo,
    notifications: Field::HasMany,
    pins: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    city: Field::String,
    state: Field::String,
    zipcode: Field::String,
    contactphone: Field::String,
    contactemail: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    shortdescription: Field::String,
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    slug: Field::String,
    cellphone: Field::String,
    fax: Field::String,
    website: Field::String,
    blog: Field::String,
    facebook: Field::String,
    twitter: Field::String,
    instagram: Field::String,
    pinterest: Field::String,
    google: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :category,
    :subcategory,
    :pilot,
    :notifications,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :category,
    :subcategory,
    :pilot,
    :notifications,
    :pins,
    :title,
    :description,
    :city,
    :state,
    :zipcode,
    :contactphone,
    :contactemail,
    :shortdescription,
    :latitude,
    :longitude,
    :slug,
    :cellphone,
    :fax,
    :website,
    :blog,
    :facebook,
    :twitter,
    :instagram,
    :pinterest,
    :google,
  ]

  # Overwrite this method to customize how listings are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(listing)
  #   "Listing ##{listing.id}"
  # end
end
