class WaitingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :book_id, :fulfilled, :sponsor_id, :sponsor_date

  belongs_to :user

end
