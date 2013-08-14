class VerEx
  def initialize regex='', prefix='', postfix=''
    @regex = regex
    @prefix = prefix
    @postfix = postfix
  end

  def something
    add '(?:.+)'
  end

  def anything
    add '(?:.*)'
  end

  def anythingBut character
    add "(?:[^#{character}]*)"
  end

  def somethingBut character
    add "(?:[^#{character}]+)"
  end

  def then value
    add sanitized(value)
  end
  alias :find :then

  def maybe value
    add "(?:#{value})?"
  end

  def anyOf values
    add "(?:[#{values}]+)"
  end

  def test value
    !!regex.match(value)
  end

  def regex
    Regexp.new(@prefix + "(?:" +  @regex + ")" + @postfix)
  end

  def or value
    VerEx.new "(?:#{@regex})|(?:#{sanitized(value)})", @prefix, @postfix
  end

  def tab
    add '\t'
  end

  def sanitized value
    Regexp.quote value
  end

  def lineBreak
    maybe("\r").then("\n")
  end
  alias :br :lineBreak

  def startOfLine
    VerEx.new @regex, '^', @postfix
  end

  def endOfLine
    VerEx.new @regex, @prefix, '$'
  end

  def searchOneLine
    VerEx.new @regex, @prefix, '$', one_line = true
  end

  def add regex
    VerEx.new @regex + regex, @prefix, @postfix
  end
end

def VerEx
  VerEx.new
end
