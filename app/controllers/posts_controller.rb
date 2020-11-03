class PostsController < ApplicationController
   #Sukuriama Autentifikacija Admin/User
   #except: useris negales daryti nieko,isskyrus tokiu dalyku kaip
     # http_basic_authenticate_with name: "admin", password:"admin",
     # except: [:index, :show]

    #Pagrindinis puslapis, skirtas postams
    #Automatiskai pats savyje iskvieciantis View(tokiu pacius vardu kaip kontroleris)
    def index 
    #Cia bus visi Postai kurie yra Duom Bazei
    # Post.all - paims visus DB esamus .. 
    # @post uzvadinom - naudosime html
    @post = Post.all
    end
    #Puslapit kur galesime kurti(addinti) naujus postus
     #Get: posts/new
    def new
        @post = Post.new
    end

    def show
        # Tas metodas iskveciamas po Create,Edit vykdymo
        # find - ieskome reikalinga mums posta kuris yra musu duom bazei
        # ir imam ji pagal id --- Default Parameter 1..2...3..
        @post = Post.find(params[:id])
         # Metodas show dabar gali mums rasti reikalinga/dominancti posta 
         # Ir jis ji gali atvaizduoti HTML faile 
         # Tai yra show posts ->  failas 
    end

    def edit
        #Kai iskvieciapam imamas reikalingas mus straipsnis
       #SUkurus metoda sukuriamas taip pat Sablonas -> View
        @post = Post.find(params[:id])
    end

    def update
       @post = Post.find(params[:id])
       #Jeigu postas teisingai updatinasi nera Validationo, tai jis
       # mes grazinam naudotoja i  redirect_to @post, o tai yra musu show
       # o jeigu error tai nukreipiat i ta pati puslapi edit
       if(@post.update(post_params))
        redirect_to @post
        else
            #Musu Puslapis tiesiog padarys Refresha
            render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])

        @post.destroy
        redirect_to posts_path
    end
    
    # Metodas veiks po New vykdymo(Strapsnio sukurimo -- 'new')
    def create
        # render --> Atlach funkcija - Patikrinimui duomenu, ar viskas veikia gerai
        # plain: --> standartinis tekstas
        # params[:post] --> paimam visa ta dalyka is tuos aprasytos post vardu formos 
        # inspect - metodas
        #render plain: params[:post].inspect
        
        # Duomenu Baze SQLite
        # Sukuriam pirmu pirmiausia modelius
        # Post - uzvadinom modeli
        # title:string body:text - tipu priskirimas prie musu formu uzvadintu reiksmiu
        # rails g model Post title:string body:text
        # Kartu sukuriamas db --> Migrate failiukas - jis reikalingas tam kad galima butu sukurti Table musu DB

        # kad galima butu dirbti su Table reikia atlikti migracija
        # rake db:migrate
        # po ko atliekama migracija ir sukurimas visu reikalingu postu
        # Create_table(:posts) - susikurem Table, su ja dabar galime dirbti

        # Taigi dabar mes galime sukurti Posta
        # @post - tiesiog uzvadinam 
        # Post - modelis DB
        # .new(params[:post]) -- perduodam tuos parametrus, kurie atvyko is musu formos
        # perdavimas  @post = Post.new(params[:post]) yra klaidingas, nes reikalingas leistinas metodas, kokius duomenis mes perduosim, Tas metodas aprasytas apacioje
        @post = Post.new(post_params)

        #Dabar reikia issaukoti ta post DB
        #Validacija, jeigu mes galime issaugoti busu Posta
        if(@post.save)
        #Be to Useri mes pervedam i nauja Puslapi
        #Tai is tiesu iskvies metoda Show(jis yra virs to metodo)
        redirect_to @post
        else
            #Musu Puslapis tiesiog padarys Refresha
            render 'new'
        end

    end
    
    #Sukuriamas Metodas Kuris nusako Kokie LAUKAI LEISTINI NAUDOJIMUI !!!!
    # Metodas private - tik cia pasiekiamas
    # Naujas metodas post_params
    #params.require - metodas
    #(:post) - is kur mes viska paimam forma
    #.permit - leistinos paimti laukai
    private def  post_params
        params.require(:post).permit(:title, :body)
    end
end
