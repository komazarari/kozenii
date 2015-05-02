module ApplicationHelper
  def link_to_if_with_block condition, options, html_options={}, &block
    if condition
      link_to options, html_options, &block
    else
      capture &block
    end
  end

  def omit(str, num)
    if str.length <= num
      str
    else
      str[0..num] + '...'
    end
  end

  def current_season
    if session['season_id'].nil?
      Season.last
    else
      Season.find(session['season_id'])
    end
  end
end
