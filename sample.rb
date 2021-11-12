require "slack-notify"
require 'clockwork'
require 'active_support/time'

module Clockwork
  sample = SlackNotify::Client.new(
    webhook_url: 'https://hooks.slack.com/services/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',
    channel: "#homework"
  )

  d = Date.today;
  case d.wday
  when 0
    e = "日"
  when 1
    e = "月"
  when 2
    e = "火"
  when 3
    e = "水"
  when 4
    e = "木"
  when 5
    e = "金"
  when 6
    e = "土"
  end
  f = "#{d.year}年 #{d.month}月 #{d.day}日 #{e}曜日"


  handler do |job|
    case job
    when '3min'
      sample.notify("#{f}です")
      sample.notify("gem code reading課題です。")
      sample.notify("3分毎に投稿します。")
    end
  end

  every(3.minutes, '3min')

end
