module ApplicationHelper
  def alert_box(alert, level = "info")
    if alert
      content_tag :div, class: "row" do
        content_tag :div, :"data-alert" => "data-alert", :class => "small-12 medium-offset-1 medium-10 columns notice alert-box radius #{level}" do
          (alert + link_to("\u00D7", "#", class: "close")).html_safe
        end
      end
    end
  end
end
