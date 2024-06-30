class CreateActiveStorageTables < ActiveRecord::Migration[7.0]
  def change
    create_table :active_storage_tables do |t|

      t.timestamps
    end
  end
end
