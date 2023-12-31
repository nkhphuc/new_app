# frozen_string_literal: true

# Create Blog model
class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
