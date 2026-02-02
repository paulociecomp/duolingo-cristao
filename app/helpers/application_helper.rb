module ApplicationHelper
  include Pagy::Frontend

  def sidebar_link_to(name, path, icon: nil)
    active = current_page?(path)
    base_classes = "flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium transition-all"
    active_classes = active ? "bg-indigo-50 text-indigo-700" : "text-gray-600 hover:bg-gray-50 hover:text-gray-900"

    link_to path, class: "#{base_classes} #{active_classes}" do
      concat content_tag(:span, icon, class: "text-xl") if icon
      concat content_tag(:span, name)
    end
  end

  def mobile_nav_link_to(path, icon:, label:)
    active = current_page?(path)
    base_classes = "flex flex-col items-center gap-1 px-3 py-1"
    active_classes = active ? "text-indigo-600" : "text-gray-500"

    link_to path, class: "#{base_classes} #{active_classes}" do
      concat content_tag(:span, icon, class: "text-xl")
      concat content_tag(:span, label, class: "text-xs")
    end
  end

  def exercise_type_icon(type)
    icons = {
      "multiple_choice" => "🔘",
      "fill_blank" => "✏️",
      "order_words" => "🔀",
      "connect_pairs" => "🔗",
      "true_false" => "✅",
      "quick_quiz" => "⚡",
      "choose_verse" => "📖",
      "sequence_story" => "📋"
    }
    icons[type.to_s] || "❓"
  end

  def format_xp(xp)
    if xp >= 1000
      "#{(xp / 1000.0).round(1)}K"
    else
      xp.to_s
    end
  end

  def time_ago_short(time)
    return "" unless time

    seconds = (Time.current - time).to_i
    case seconds
    when 0..59 then "agora"
    when 60..3599 then "#{seconds / 60}min"
    when 3600..86399 then "#{seconds / 3600}h"
    else "#{seconds / 86400}d"
    end
  end
end
