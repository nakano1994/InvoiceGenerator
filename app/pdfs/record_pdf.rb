# coding: utf-8

# coding: utf-8
class RecordPdf < Prawn::Document
  def initialize(record)
    super(
      page_size: 'A4',
      top_margin: 40,
      bottom_margin: 30,
      left_margin: 20,
      right_margin: 20
    )
    font 'app/assets/fonts/ipaexm.ttf'
    @record = record

    header
    table_content
  end
  def header
    text "請求書", size: 28
    stroke_color "eeeeee"
    stroke_line [0, 680], [530, 680]
  end
  def table_content
    # tableメソッドは2次元配列を引数(line_item_rows)にとり、それをテーブルとして表示する
    # ブロック(do...end)内でテーブルの書式の設定をしている
    table line_item_rows do
      # 全体設定
      cells.padding = 8          # セルのpadding幅
      cells.borders = [:bottom,] # 表示するボーダーの向き(top, bottom, right, leftがある)
      cells.border_width = 0.5   # ボーダーの太さ

      # 個別設定
      # row(0) は0行目、row(-1) は最後の行を表す
      row(0).border_width = 1.5
      row(-2).border_width = 1.5
      row(-1).background_color = "f0ad4e"
      row(-1).borders = []

      self.header     = true  # 1行目をヘッダーとするか否か
      self.row_colors = ['dddddd', 'ffffff'] # 列の色
      self.column_widths = [50, 200, 100, 70, 100] # 列の幅
    end
  end
  def line_item_rows
    # テーブルのヘッダ部
    arr = [["#", "品名", "単価", "数量", "値段"]]
    # テーブルのデータ部
    @record.answers.each_with_index do |item, i|
      arr << [i+1, item.product_name, item.price, item.quantity, item.total_price]
    end

    # テーブルの合計部
    arr << ["", "", "", "合計", @record.total_price]
    return arr
  end
end
