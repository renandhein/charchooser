class CreateCharacterTraits < ActiveRecord::Migration[5.2]
  def change
    create_table :character_traits do |t|
      t.references :character, null: false, index: true, foreign_key: true
      t.references :trait, null: false, index: true, foreign_key: true
      t.integer :value, null: false   
    end
  end
end
