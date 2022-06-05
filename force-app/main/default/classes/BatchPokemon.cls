public with sharing class BatchPokemon  implements Database.Batchable<Pokemon__c>, Database.AllowsCallouts, Database.Stateful { //para mantener el estado en todas las transacciones especifico Database.Stateful en la definición de clase 
    
        private List<Pokemon__c> listPokemon;
        public BatchPokemon(List<Pokemon__c> listPokemon) {

            this.listPokemon=listPokemon;//Mi constructor de la lista
            
        }

        public Iterable<Pokemon__c> start(Database.BatchableContext bc) {//mi metodo start
            return listPokemon; //collect the batches of records or objects to be passed to execute
            //la lista que tengo se la paso al metodo execute
        }


        public void execute(Database.BatchableContext bc, List<Pokemon__c> listPokemon){// Lista de pokemon para insertar
            // process each batch of records
            try {
                Http http = new Http();
                HttpRequest req = new HttpRequest();
                req.setEndpoint('https://pokeapi.co/api/v2/pokemon' + listPokemon[0].PokeIndex__c);//el batch comienza con el primer elemento de la lista
                req.setHeader('Content-Type', 'aplication/json');//las llamadas a API externas las trabajo de a 1 elemento porque puede fallar, y asi se me hace mas facil saber dnd fallo
                req.setMethod('GET');
                HttpResponse resp = http.send(req);
                String body =resp.getBody();
                Pokemon poke = Pokemon.parse(body);//instancio
                Pokemon__c pokemonNuevo = new Pokemon__c();//instancio el objeto Pokemon
                 if (resp.getStatusCode() == 200) {
                        //si la respuesta es 200 o sea se conecto con exito
                    pokemonNuevo.Name = poke.name.Capitalize(); //obtengo y le asigno el name de poke y se lo paso a mi pokemonNuevo para luego poder insertarlo
                    pokemonNuevo.Altura__c = poke.height.format()+' ft.';  //altura y uso el .format() para pasar el tipo de dato de string a int
                    pokemonNuevo.Peso__c = poke.weight.format()+' lbs.';//peso
                    pokemonNuevo.PokeIndex__c =poke.id;//id del pokemon
                    pokemonNuevo.Foto__c = poke.sprites.front_default;//imagenes de los pokemons en este caso solo trabajo con front_default
                    for( Integer i = 0; i < poke.types.size(); i++){ //obtengo los tipos de pokemon, los cuales podrian venir mas de un tipo por cada pokemon
                        pokemonNuevo.Tipo__c =  pokemonNuevo.Tipo__c == null ? poke.types[i].type.name :  pokemonNuevo.Tipo__c + ';' + poke.types[i].type.name;  //operador ternario
                    }
                  
                    if(poke.id <=151){ //condiciono para asignarle una generacion al pokemonNuevo
                        pokemonNuevo.Generation__c = 1; //le asigno la generacion al pokemonnuevo
                    }
                    else if( poke.id <= 251){
                        pokemonNuevo.Generation__c = 2;
                        
                    } else if( poke.id<= 386){
                        pokemonNuevo.Generation__c = 3;
                    }
                    else if(poke.id <= 493){
                        pokemonNuevo.Generation__c = 4;
                    }
                    else if(poke.id<= 649){
                        pokemonNuevo.Generation__c = 5;
                    }
                    else if (poke.id <=721){
                        pokemonNuevo.Generation__c = 6;
                    }
                    else if (poke.id <=809){
                        pokemonNuevo.Generation__c = 7;
                    }
                    else if (poke.id <=905){
                        pokemonNuevo.Generation__c = 8;
                    }
                    
                 insert pokemonNuevo; //inserto mi nuevo pokemon con los datos asignados
                }
            }catch(Exception e){
            System.debug('no se pudo cargar el pokemon');
            } 
        }
        public void finish (Database.BatchableContext bc){

            System.debug('Batch finalizado con exito');
        /* AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
            // call some utility to send email
            EmailUtils.sendMessage(job, recordsProcessed); */

        }   

}