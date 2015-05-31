class CreatePhotosAndHashtags < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :caption

      t.timestamps null: false
    end
    
    create_table :hashtags do |t|
      t.string :text

      t.timestamps null: false
    end

    create_table :hashtags_photos, id: false do |t|
      t.belongs_to :photo, index: true
      t.belongs_to :hashtag, index: true
    end
  end
end
