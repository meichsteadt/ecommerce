class HomeController < ApplicationController
  def index

  end

  def show
    @address = "1234 Main St."
    @city = "Portland"
    @state = "OR"
    @zip = "97312"
  end
end
