class WidgetsControllerTest < ActionController::TestCase
  test "can create widgets" do
    post :create, color: "red", count: 2

    assert_equal 200, response.status
    assert_equal 2, Widget.count
    assert_equal 2, Widget.where(shipped: false).count
  end

  test "it can mark (most recent) widgets as shipped" do
    post :create, color: "blue", count: 5
    post :ship, count: 3

    assert_equal 200, response.status
    assert_equal 3, Widget.where(shipped: true).count
    assert_equal 2, Widget.where(shipped: false).count
  end

  test "it handles invalid params" do
    post :create

    refute_equal 500, response.status
    assert_equal 0, Widget.count
    assert_include response.body, "color is required"
  end
end
