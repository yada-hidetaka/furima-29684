class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :phone,          default: "",  null: false
      t.string :postal_code,    default: "",  null: false
      t.string :city,           default: "",  null: false
      t.string :block,          default: "",  null: false
      t.integer :prefecture_id,              null: false
      t.string :build,          default: ""
      t.references :order,                    null: false,   foreign_key: true
      t.timestamps
    end
  end
end
