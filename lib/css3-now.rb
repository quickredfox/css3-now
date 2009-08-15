# ...
class CSS3Now

  class << self
    attr_accessor :substitutions
  end

  @substitutions = [
    lambda {|css| replace_browser_specific css, 'border-radius' },
    lambda {|css| replace_browser_specific css, 'box-shadow' },
    lambda {|css| css.gsub(/opacity: ([\w\.]+);/){ "filter:alpha(opacity=#{ ($1.to_f * 100).to_i }); opacity: #{ $1 };" } }
  ]

  def self.substitution &block
    @substitutions << block
  end

  def initialize original_css
    @original_css = original_css
  end

  def to_css
    CSS3Now.substitutions.inject(@original_css) do |css, substitution|
      css = substitution.call css
    end
  end

  def self.replace_browser_specific css, attribute, browsers = nil
    css.gsub /#{ attribute }:([^;]+);/, browser_specific(attribute, '\1', browsers) 
  end

private

  def self.browser_specific attribute, value, browsers = nil
    browsers = [ :moz, :webkit, :khtml ] if browsers.nil?
    browsers.inject("") do |all, browser|
      all << "-#{ browser }-#{ attribute }:#{ value }; "
      all
    end + "#{ attribute }:#{ value };"
  end

end
