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

  it 'should work with additional characters: -, ., #' do
    css = CSS3Now.new("#header {\n  border-radius: 5em 10px -3.4em #fff;\n }").to_css
    css.should == "#header {\n  -moz-border-radius: 5em 10px -3.4em #fff; -webkit-border-radius: 5em 10px -3.4em #fff; " + 
                  "-khtml-border-radius: 5em 10px -3.4em #fff; border-radius: 5em 10px -3.4em #fff;\n }"
  end

  it 'should work with multiple instances of an attibute' do
    CSS3Now.new("#x {\n  opacity: 0.5;\n } #y {\n  opacity: 0.4;\n }").to_css.should == 
      "#x {\n  filter:alpha(opacity=50); opacity: 0.5;\n }" + 
      " #y {\n  filter:alpha(opacity=40); opacity: 0.4;\n }"

    css = CSS3Now.new("#header1 {\n border-radius: 1px;\n } " +
                      "#header2 {\n border-radius: 5em;\n }" ).to_css
    css.should == 
      "#header1 {\n -moz-border-radius: 1px; -webkit-border-radius: 1px; -khtml-border-radius: 1px; border-radius: 1px;\n } " + 
      "#header2 {\n -moz-border-radius: 5em; -webkit-border-radius: 5em; -khtml-border-radius: 5em; border-radius: 5em;\n }"
  end

  it 'should replace box-shadow' do
    css = CSS3Now.new("#header {\n  box-shadow: 5em;\n }").to_css
    css.should == "#header {\n  -moz-box-shadow: 5em; -webkit-box-shadow: 5em; " + 
                  "-khtml-box-shadow: 5em; box-shadow: 5em;\n }"
  end

  it 'should replace opacity' do
    CSS3Now.new("#x {\n  opacity: 0.5;\n }").to_css.should == "#x {\n  filter:alpha(opacity=50); opacity: 0.5;\n }"
  end

end
