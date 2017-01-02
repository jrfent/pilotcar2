class ChangeDataTypeForFee < ActiveRecord::Migration
    def self.up
     change_column :loads, :fee, :decimal
    end
    def self.down
     change_column :loads, :fee, :integer
    end
  end
