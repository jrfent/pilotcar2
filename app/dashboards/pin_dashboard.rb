require "administrate/base_dashboard"

class PinDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    listing: Field::BelongsTo,
    pilot: Field::BelongsTo,
    id: Field::Number,
    description: Field::String,
    image_file_name: Field::String,
    image_content_type: Field::String,
    image_file_size: Field::Number,
    image_updated_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :listing,
    :pilot,
    :id,
    :description,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :listing,
    :pilot,
    :id,
    :description,
    :image_file_name,
    :image_content_type,
    :image_file_size,
    :image_updated_at,
    :created_at,
    :updated_at,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :listing,
    :pilot,
    :description,
    :image_file_name,
    :image_content_type,
    :image_file_size,
    :image_updated_at,
  ]

  # Overwrite this method to customize how pins are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(pin)
  #   "Pin ##{pin.id}"
  # end
end
