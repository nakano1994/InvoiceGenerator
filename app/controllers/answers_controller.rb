# coding: utf-8
class AnswersController < ApplicationController
  before_action :set_sheet
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  def new
    @answer = Answer.new
  end
  def create
    @answer = @sheet.answers.new(answer_params)
    if @answer.save
      redirect_to @sheet, notice: "作成が完了しました。"
    else
      render :new
    end
  end
  def edit
    
  end
  def update
    if @answer.update(answer_params)
      redirect_to @sheet, notice: '更新が完了しました。'
    else
      render :edit
    end
  end
  def destroy
    @answer.destroy
    redirect_to [@sheet], notice: '削除が完了しました。'
  end
  private
  def set_sheet
    @sheet = Sheet.find(params[:sheet_id])
  end
  def set_answer
    @answer = Answer.find(params[:id])
  end
  def answer_params
    params.require(:answer).permit(:product_name, :price, :quantity)
  end
end
