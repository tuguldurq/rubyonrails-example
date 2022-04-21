class AddArticleIdToUploads < ActiveRecord::Migration[7.0]
  def change
    add_column :uploads, :article_id, :integer
  end
end
