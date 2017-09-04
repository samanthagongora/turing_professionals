module Omniauth
  def mock_auth_hash

    OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new({
     'provider' => 'linkedin',
     'uid' => '123545',
     'info' => {
       'first_name' => 'mock',
       'last_name' => 'user',
       'description' => 'student',
       'email' => 'test@example.com',
       'urls' => {
         'public_profile' => 'http://test.test/public_profile'
       }
     },
     'credentials' => {
       'token' => 'mock_token',
       'secret' => 'mock_secret'
     },
     'extra' => {
       'raw_info' => {
         'industry' => 'Software',
         'pictureUrl' => 'http://photo.com'
       }
     }
   })
 end
end
