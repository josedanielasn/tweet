class Pagination
  def initialize(input_array, params)
    @input_array = input_array
    @params = params
  end

  def call
    post_per_page = 5
    @page = @params.fetch(:page, 0).to_i
    @post_five = @input_array[(@page * post_per_page)..((@page * post_per_page) + 5)]
    @post_five
  end

  def last_page
    @last_page = (@input_array.count / 5.0).ceil
  end
  def page
    @page = @params.fetch(:page, 0).to_i
  end
end 


