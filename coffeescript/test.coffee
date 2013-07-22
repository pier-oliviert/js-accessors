class @User extends @Accessible
  attr_accessible: ['name', 'email']
             
test "User should have 2 getters: name & email", ->
  user = new User()
  ok typeof(user.name) is 'function', 'User has a name getter'
  ok typeof(user.email) is 'function', 'User has an email getter'

test "ability to set value to each attributes", ->
  user = new User()
  ok user.email() is undefined, 'Email should be undefined when nothing was set'
  user.email('roger.brulotte@thatsmyboi.com')
  ok user.email() is 'roger.brulotte@thatsmyboi.com', "Email shoule be roger.brulotte@thatsmyboi.com"
  ok user.name() is undefined, 'Name should be undefined when nothing has been set'
  user.name('Roger Brulotte')
  ok user.name() is 'Roger Brulotte', "User's name should be Roger Brulotte, it is #{user.name()}"

test "different instances do not share the same variable", ->
  john = new User()
  john.name("John")
  gary = new User()
  gary.name("Gary")

  ok john.name() is "John", "John lost his name"
  ok gary.name() is "Gary", "Gary lost his name"

  ok john.name() isnt gary.name(), "John and Gary shouldn't have the same name"
