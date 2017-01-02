class AddCompanyToTruckers < ActiveRecord::Migration
  def change
    add_column :truckers, :company, :string
  end
end
