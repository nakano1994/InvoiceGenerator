# coding: utf-8
class SheetsController < ApplicationController
  before_action :set_sheet, only: [:show]
  def index
  end
  def show
    @answers = @sheet.answers
    respond_to do |format|
      format.html
      format.pdf do
        pdf = RecordPdf.new(@sheet)
        send_data pdf.render,
                  filename: "sample.pdf",
                  type:        "application/pdf",
                  disposition: "inline"
      end
    end
  end
  def new
  end
  def create
    arrays = []
    arrays.push(params["product_name"])
    arrays.push(params["price"])
    arrays.push(params["quantity"])
    arrays = arrays.transpose

    
    # @sheet = Sheet.create(user_id: current_user&.id)
    # arrays.each do |array|
    #   Answer.create(product_name: array[0], price: array[1], quantity: array[2], sheet_id: @sheet.id)
    # end


    @sheet = Sheet.create(user_id: current_user&.id)
    arrays.each do |array|
      Answer.create(product_name: array[0], price: array[1], quantity: array[2], sheet_id: @sheet.id)
    end

    
    redirect_to [@sheet]
  end
  def destroy
  end
  private
  def set_sheet
    @sheet = Sheet.find(params[:id])
  end
end
