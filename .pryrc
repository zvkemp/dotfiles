Pry.config.theme = "molokai"

module Pasteboard
  def pbcopy(data)
    IO.popen('pbcopy', 'w') do |pipe|
      pipe << data.to_s
    end
  end

  def pbpaste
    `pbpaste`
  end
end

self.extend(Pasteboard)

# class Array
#   def to_proc
#     -> (x) { x.send(*self) }
#   end
# end
