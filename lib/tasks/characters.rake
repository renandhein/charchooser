namespace :characters do
  desc "Reads a character list from a JSON file and inserts them on the database"
  task read: :environment do
    _data_hash = JSON.parse(File.read((ENV["filepath"] || ENV["filename"] || "characters.json")))

    ActiveRecord::Base.transaction do
      _data_hash["characters"].each do |_character_hash|
        _character = Character.create!(:image_path => _character_hash["image_path"])

        _character_hash["traits"].each do |_trait_name, _trait_value|
          _trait = Trait.find_or_create_by(description: _trait_name)

          CharacterTrait.create!(character: _character, trait: _trait, value: _trait_value)
        end
      end
    end
  end

  desc "Removes all characters and traits from the database"
  task clear: :environment do
    ActiveRecord::Base.transaction do
      CharacterTrait.all.each(&:destroy)
      Character.all.each(&:destroy)
      Trait.all.each(&:destroy)
    end
  end
end
