class CreatePeopleCamps < ActiveRecord::Migration[7.0]
  def change
    create_join_table :camps, :people, table_name: "people_camps" do |t|
  t.index [:person_id, :camp_id]
  t.index [:camp_id, :person_id]
end
end
end
