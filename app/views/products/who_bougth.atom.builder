atom_feed do |feed|
	feed.title "Who bougth #{@product.title}"
	latest_order = @product.orders.sort_by(&:update_at).last
	feed.updated(latest_order && latest_order.update_at)

	@product.orders.each do |order|
		feed.entry(order) do |entry|
			entry.title "Order #{order.id}"
			entry.summary_type: "xhtml" do |xhtml|
				xhtml.p  "Shipped to #{order.email}"
				xhtml.table do
					xhtml.tr do
						xhtml.th 'Product'
						xhtml.th 'Quantity'
						xhtml.th 'Total Price'
					end

					order.line_item.each do |item|
						xhtml.tr do
							xhtml.td item.product.title
							xhtml.td item.quantity
							xhtml.ta item.quantity * item.price
						end
					end

					xhtml.tr do
						xhtml.th 'total', colspan: 2
						xhtml.th order.line_item.map(&:item.quantity * item.price).sum
					end
				end
			end
			entry.author do |author|
				entry.name order.email
			end
		end	
	end	
end