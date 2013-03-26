Notes from in the field (TDD learnings)
=======================================

Testing sessions:

Started
.E
===============================================================================
Error: test_user_can_logout(SessionsControllerTest)
  ActionController::RoutingError: No route matches {:session=>{:id=>"65"}, :controller=>"sessions", :action=>"destroy"}
test/functional/sessions_controller_test.rb:25:in `block in <class:SessionsControllerTest>'
===============================================================================


Finished in 0.427775 seconds.

2 tests, 4 assertions, 0 failures, 1 errors, 0 pendings, 0 omissions, 0 notifications
0% passed

4.68 tests/s, 9.35 assertions/s


10:05:44 - INFO - Running: test/functional/sessions_controller_test.rb
WARNING: Nokogiri was built against LibXML version 2.9.0, but has dynamically loaded 2.7.8
Rack::File headers parameter replaces cache_control after Rack 1.5.
Started
.E
===============================================================================
Error: test_user_can_logout(SessionsControllerTest)
  AbstractController::ActionNotFound: The action 'destroy' could not be found for SessionsController
test/functional/sessions_controller_test.rb:25:in `block in <class:SessionsControllerTest>'
===============================================================================


Finished in 0.436901 seconds.

2 tests, 4 assertions, 0 failures, 1 errors, 0 pendings, 0 omissions, 0 notifications
0% passed

4.58 tests/s, 9.16 assertions/s


10:06:12 - INFO - Running: test/functional/sessions_controller_test.rb
WARNING: Nokogiri was built against LibXML version 2.9.0, but has dynamically loaded 2.7.8
Rack::File headers parameter replaces cache_control after Rack 1.5.
Started
.E
===============================================================================
Error: test_user_can_logout(SessionsControllerTest)
  ActionView::MissingTemplate: Missing template sessions/destroy, application/destroy with {:locale=>[:en], :formats=>[:html], :handlers=>[:erb, :builder, :coffee]}. Searched in:
    * "/Users/academy/Documents/Projects/santa-4-cyclists/app/views"
test/functional/sessions_controller_test.rb:25:in `block in <class:SessionsControllerTest>'
===============================================================================


Finished in 0.456731 seconds.

2 tests, 4 assertions, 0 failures, 1 errors, 0 pendings, 0 omissions, 0 notifications
0% passed

4.38 tests/s, 8.76 assertions/s


10:06:55 - INFO - Running: test/functional/sessions_controller_test.rb
WARNING: Nokogiri was built against LibXML version 2.9.0, but has dynamically loaded 2.7.8
Rack::File headers parameter replaces cache_control after Rack 1.5.
Started
..

Finished in 0.439125 seconds.

2 tests, 5 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
0% passed

To get this to pass we had the initial error occuring as we were mistakenly passing the session to the delete method. We then changed this to just use `delete :destroy, { :id, @user }` which figures out that we want the @user.id.

The next message puts us back into TDD design mode as it told us we had not destroy method in our sessions controller. From there its just a case of deleting the session and redirecting to the root_url in this case