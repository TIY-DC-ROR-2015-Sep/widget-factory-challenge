class ReviewsControllerTest < ActionController::TestCase
  test "can create reviews" do
    w = Widget.create! color: "red"

    post :create, widget_id: w.id, stars: 4, message: "This widget changed my life", author: "Gareth Cutestorey"

    assert_equal 200, response.status
    assert_equal 1, w.reviews.count

    r = w.reviews.last
    assert_equal 4, r.stars
  end

  test "requires a star count" do
    w = Widget.create! color: "blue"

    post :create, widget_id: w.id, message: "I have opinions", author: "A Person"

    refute_equal 500, response.status
    assert_equal 0, w.reviews.count
  end

  test "defaults an author" do
    w = Widget.create! color: "green"

    post :create, widget_id: w.id, stars: 1, message: "Awful, just awful"

    assert_equal 200, response.status
    assert_equal 1, w.reviews.count

    r = w.reviews.last
    assert_equal 1, r.stars
    assert_equal "Anonymous Coward", r.author
  end
end
