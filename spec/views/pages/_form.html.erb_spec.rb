require 'spec_helper'

describe 'pages/_editable_form.html.erb' do
  before do

    login_user(Factory(:faculty_frank))
    assign(:page, Factory.build(:page))
    assign(:courses, [
      stub_model(Course),
      stub_model(Course)
    ])
    assign(:button_name, "Update")
    render :locals => { :button_name => "Update" }
  end

  it 'should have title fields' do
      rendered.should have_selector('form') do |f|
      f.should have_selector("input[name='page[title]']")
      f.should have_selector("textarea[name='page[tab_one_contents]']")
    end
  end
end