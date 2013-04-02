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


1. Do we want to make the users resubmit the queries to Amazon? Probably not, so we would need to hold onto where the request came from & after they have signed in then we should send them back to where they were with the correct request. How can we do this in an Ajax way? Do we need to move to a Gem like PAX?

2. Make the front pages consistent
3. Figure out how to use many-to-many relationships. Determine if we really need them for the user-items links.
4. Socalise - tweet/fb about what has been selected.
5. User profiles
6. Invite gift purchasers (send link with user related login)
7. Use email to send updates if user/gift purchaser opts in / request them
8. Make some notes on testing and share with group :options [uncommitted, recent]
9. How do we refactor the code into a gem for authorisation? What is the process and are there any good tutorials that are up-to-date for Rails 3.2? Most seem to be purely Ruby focused!
10. Create better factories. Look at how Factory-Girl & Machinist gems do this. Try to understand the processes they use
11. 

