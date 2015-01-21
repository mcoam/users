class users (
  $users = hiera('users')
){
  create_resources(users::add_user, $users)
include 'users::del_user'
}
