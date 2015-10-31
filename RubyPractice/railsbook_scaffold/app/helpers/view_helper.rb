module ViewHelper
  def format_datetime(datetime,type = :datetime)
    #datetimeがnilの場合は空文字列を返す
    return '' unless datetime

    #引数typeの値に応じて対応するフォーマットをセット
    case type
      when :datetime
        format = "%Y年%m月%d日 %H:%M:%S"
      when :date
        format = "%Y年%m月%d日"
      when :time
        format = "%H:%M:%S" 
    end

    # 指定されたフォーマットで日付時刻を整形
    datetime.strftime(format)
  end

  def list_tag(collection, prop)
    #<ul> タグ生成
    content_tag(:ul) do
      collection.each do |element|
        concat content_tag(:li,element.attributes[prop])
      end
    end
  end

end
