module ProductCategoriesHelper

  def nested_categories (categories)
    categories.map do |categorie, sub_categories|
      if sub_categories == {}
        content_tag(:li, render(categorie  ))
      else
        content_tag(:li, content_tag(:li,render(categorie) + content_tag(:ul, nested_categories(sub_categories), class:""), class:""))
      end
    end.join.html_safe
  end
 

  def nested_categories_menu (categories)
    categories.map do |categorie, sub_categories|
      if sub_categories == {}
        content_tag(:li, render(:partial => 'product_categories/product_category_menu', :object  => categorie  ))
      else
        content_tag(:li, content_tag(:li,render(:partial => 'product_categories/product_category_menu', :object  => categorie ) + content_tag(:ul, nested_categories_menu(sub_categories), class:"nav nav-list tree"), class:"tree-toggler nav-header"))
      end
    end.join.html_safe
  end

end
