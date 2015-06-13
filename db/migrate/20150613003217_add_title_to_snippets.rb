class AddTitleToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :title, :string
  end
end
