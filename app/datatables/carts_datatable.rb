class CartsDatatable

	delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Cart.count,
      iTotalDisplayRecords: carts.total_entries,
      aaData: data
    }
  end

private

  def data
    carts.map do |cart|
      [
        cart.id,
        h(cart.created_at.strftime("%d/%m/%Y")),
        h(cart.updated_at.strftime("%d/%m/%Y")),
        h(cart.total_price),
        h(cart.total_price),
        link_to("<i class='icon-zoom-in'></i>".html_safe, cart,class:'btn btn-mini')
      ]
    end
  end

  def carts
    @carts ||= fetch_carts
  end

  def fetch_carts
    carts = Cart.order("#{sort_column} #{sort_direction}")
    carts = carts.page(page).per_page(per_page)
    if params[:sSearch].present?
      carts = carts.where("total_price = :search", search: "%#{params[:sSearch]}%")
    end
    carts
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[id user ]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end