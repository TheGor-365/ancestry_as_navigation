class Page < ApplicationRecord
  # attr_accessible :parent_id, :content, :name

  has_ancestry
end
