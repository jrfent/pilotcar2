class AddCreatedAtToPins < ActiveRecord::Migration
  def change
    add_timestamps(:pins)
  end
end
