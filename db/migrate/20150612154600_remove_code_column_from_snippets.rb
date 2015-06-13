class RemoveCodeColumnFromSnippets < ActiveRecord::Migration
  def change
    remove_column :snippets, :language
  end
end
