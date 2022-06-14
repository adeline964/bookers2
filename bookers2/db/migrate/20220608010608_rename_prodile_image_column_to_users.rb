class RenameProdileImageColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users,:prodile_image,:profile_image
  end
end
