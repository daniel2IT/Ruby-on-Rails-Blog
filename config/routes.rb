Rails.application.routes.draw do
  get 'home/index'
  get 'contacts/index'
  #Pagrindinis puslapis (koksai kontroleris#metodas atsakingas)
  root 'posts#index', as: 'home'

  #getas salutiniai puslapiai
  #Get: /about
  get 'about' => 'pages#about', as: 'about'
   #Get: /contacts
  get 'contacts' => 'pages#contacts', as: 'contacts'


  #resources:(kontroleris) komanda: rake routes - parodo visus imanomus URL, kurie gali buti panaudoti 
  #Get: posts/... - Ras visus URL adresus susijusius su rake routes
  # Cia yra ir delete/ir Edit .. itt 
  resources :posts do
    resources :comments
  end

  #post 'messages'#create
  #/posts/1/comments (MATOM) kaip padaryti  
  #rake routes
end
