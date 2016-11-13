module PostsHelper

  def format_time(time)
   time.strftime("%m/%d/%Y %H:%M")
  end
  
end