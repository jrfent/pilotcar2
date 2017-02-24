require "administrate/base_dashboard"

class BidDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    pilot: Field::BelongsTo,
    load: Field::BelongsTo,
    id: Field::Number,
    fee: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    note: Field::Text,
    fee_type: Field::String,
    confirm: Field::Boolean,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :pilot,
    :load,
    :id,
    :fee,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :pilot,
    :load,
    :id,
    :fee,
    :created_at,
    :updated_at,
    :note,
    :fee_type,
    :confirm,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :pilot,
    :load,
    :fee,
    :note,
    :fee_type,
    :confirm,
  ]

  # Overwrite this method to customize how bids are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(bid)
  #   "Bid ##{bid.id}"
  # end
end
