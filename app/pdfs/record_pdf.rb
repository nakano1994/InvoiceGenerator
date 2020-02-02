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
  end
end
