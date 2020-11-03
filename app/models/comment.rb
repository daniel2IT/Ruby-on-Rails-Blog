class Comment < ApplicationRecord
  # Duoti komentarai priklauso tam tikriems posto modeliams
  belongs_to :post
end
