class PagesController < ApplicationController
    #Atsakingas uz keleta Statinius puslapius(kurie nesikeis, visada yra vienodi)
    def about
        #kintamasis kuris bus isvestas View dal.
        @heading = 'Puslapis apie mus'
    end
    def contacts

    end
end
