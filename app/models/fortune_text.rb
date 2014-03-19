class FortuneText

  attr_accessor :long, :dirty

  def initialize(options = {})
    options.each do |key, value|
      send("#{ key }=", ((value.is_a?(String) and value =~ /^\d+$/) ? value.to_i : value)) if respond_to?("#{ key }=")
    end
  end

  def long_argument
    case @long
    when 0 then '-s'
    when 1 then '-l'
    end
  end

  def dirty_argument
    case @dirty
    when 1 then '-o'
    end
  end

  def arguments
    [long_argument, dirty_argument].compact
  end

  def to_s
    `fortune #{ arguments.join(' ') }`
  end

  def as_json(include_all = true)
    { text: to_s }
  end

end