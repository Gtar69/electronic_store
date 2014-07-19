module ProductsHelper

  def render_product_photo(photo)
    if photo.present?
      image_url = photo.image_url
    else
      image_url = "http://placehold.it/300x300&text=No Pic"
    end


    image_tag(image_url, :class => "thumbnail", :size => "300x300")

  end  

  def render_product_name(product)
    product.title
  end  

end
