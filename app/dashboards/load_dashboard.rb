require "administrate/base_dashboard"

class LoadDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    trucker: Field::BelongsTo,
    bids: Field::HasMany,
    pilots: Field::HasMany,
    id: Field::Number,
    origin_country: Field::String,
    origin_city: Field::String,
    origin_state: Field::String,
    origin_zipcode: Field::String,
    destination_country: Field::String,
    destination_city: Field::String,
    destination_state: Field::String,
    destination_zipcode: Field::String,
    fee: Field::String.with_options(searchable: false),
    fee_type: Field::String,
    distance: Field::Number,
    pickup_datetime: Field::DateTime,
    delivery_datetime: Field::DateTime,
    special_notes: Field::Text,
    pilotcar_count: Field::Number,
    polecar_needed: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    current_status: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :trucker,
    :bids,
    :pilots,
    :id,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :trucker,
    :bids,
    :pilots,
    :id,
    :origin_country,
    :origin_city,
    :origin_state,
    :origin_zipcode,
    :destination_country,
    :destination_city,
    :destination_state,
    :destination_zipcode,
    :fee,
    :fee_type,
    :distance,
    :pickup_datetime,
    :delivery_datetime,
    :special_notes,
    :pilotcar_count,
    :polecar_needed,
    :created_at,
    :updated_at,
    :current_status,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :trucker,
    :bids,
    :pilots,
    :origin_country,
    :origin_city,
    :origin_state,
    :origin_zipcode,
    :destination_country,
    :destination_city,
    :destination_state,
    :destination_zipcode,
    :fee,
    :fee_type,
    :distance,
    :pickup_datetime,
    :delivery_datetime,
    :special_notes,
    :pilotcar_count,
    :polecar_needed,
    :current_status,
  ]

  # Overwrite this method to customize how loads are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(load)
  #   "Load ##{load.id}"
  # end
end
