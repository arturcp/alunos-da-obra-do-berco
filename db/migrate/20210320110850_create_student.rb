class CreateStudent < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :description
      t.string :email
      t.string :phone
      t.string :mobile_phone
      t.string :address
      t.integer :gender
      t.date :birth_date
      t.string :website
      t.string :twitter
      t.string :instagram
      t.string :facebook
      t.string :observation
      t.string :youtube_video

      t.timestamps
    end
  end
end
