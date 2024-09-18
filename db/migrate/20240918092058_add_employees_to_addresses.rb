class AddEmployeesToAddresses < ActiveRecord::Migration[7.1]
  def change
    add_reference :addresses, :employee, null: false, foreign_key: true
  end
end
