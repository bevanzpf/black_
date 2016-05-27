require 'test_helper'

class WorksControllerTest < ActionController::TestCase

  def setup
    @work = works(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Work.count' do
      post :create, work: { desc: "a special day", subject: "wedding day"}
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Work.count' do
      delete :destroy, id: @work
    end
  end
end
