class ArticleCategory < ActiveRecord::Base
  #many to many
  belongs_to :article
  belongs_to :category
end