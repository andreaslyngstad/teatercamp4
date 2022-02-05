class CreateDataFiles < ActiveRecord::Migration[7.0]
  def self.up
    create_table :data_files do |t|


    end
  end

  def self.down
    drop_table :data_files
  end
end
