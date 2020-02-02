class SheetsController < ApplicationController
  before_action :set_sheet, only: [:show]
  def index
  end
  def show
  end
  def new
  end
  def create
  end
  def destroy
  end
  private
  def set_sheet
    @sheet = ""
  end
end
