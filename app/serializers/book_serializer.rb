class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :authors, :publisher, :publishedDate, :description, :image_url, :api_id, :waitings

  has_many :reviews
  
  def waitings
    ActiveModel::SerializableResource.new(object.waitings,  each_serializer: WaitingSerializer)
  end


end
