require File.dirname(__FILE__) + '/spec_helper'

describe CSS3Now do

  it 'should replace border-radius' do
    css = CSS3Now.new("#header {\n  border-radius: 5em;\n }").to_css
    css.should == "#header {\n  -moz-border-radius: 5em; -webkit-border-radius: 5em; " + 
                  "-khtml-border-radius: 5em; border-radius: 5em;\n }"
  end

  it 'should work with spaces in value' do
    css = CSS3Now.new("#header {\n  border-radius: 5em 10px -3.4em;\n }").to_css
    css.should == "#header {\n  -moz-border-radius: 5em 10px -3.4em; -webkit-border-radius: 5em 10px -3.4em; " + 
                  "-khtml-border-radius: 5em 10px -3.4em; border-radius: 5em 10px -3.4em;\n }"
  end

  it 'should work with multiple instances of an attibute'

  it 'should replace box-shadow' do
    css = CSS3Now.new("#header {\n  box-shadow: 5em;\n }").to_css
    css.should == "#header {\n  -moz-box-shadow: 5em; -webkit-box-shadow: 5em; " + 
                  "-khtml-box-shadow: 5em; box-shadow: 5em;\n }"
  end

  it 'should replace opacity' do
    CSS3Now.new("#x {\n  opacity: 0.5;\n }").to_css.should == "#x {\n  filter:alpha(opacity=50); opacity: 0.5;\n }"
  end

end
