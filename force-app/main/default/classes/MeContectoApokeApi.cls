public with sharing class MeContectoApokeApi {
    public static String meConecto(Integer idPokemon){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://pokeapi.co/api/v2/pokemon/' + idPokemon);//el batch comienza con el primer elemento de la lista
        req.setHeader('Content-Type', 'aplication/json');//las llamadas a API externas las trabajo de a 1 elemento porque puede fallar, y asi se me hace mas facil saber dnd fallo
        req.setMethod('GET');
        String result;
        HttpResponse resp = http.send(req);
        String body =resp.getBody();
        Pokemon poke = Pokemon.parse(body);//instancio
        Pokemon__c pokemonNuevo = new Pokemon__c();//instancio el objeto Pokemon
        if (resp.getStatusCode() == 200) {
            //si la respuesta es 200 o sea se conecto con exito
            System.debug('Me conecte con exito' + body);
            
            system.debug('pokemon es :'+ poke);
            pokemonNuevo.Name = poke.name.Capitalize(); //obtengo y le asigno el name de poke y se lo paso a mi pokemonNuevo para luego poder insertarlo
            pokemonNuevo.Altura__c = poke.height.format()+' ft.';  //altura y uso el .format() para pasar el tipo de dato de string a int
            pokemonNuevo.Peso__c = poke.weight.format()+' lbs';//peso
            pokemonNuevo.PokeIndex__c =poke.id;//id del pokemon
            pokemonNuevo.Foto__c = poke.sprites.front_default;//imagenes de los pokemons en este caso solo trabajo con front_default
             result=body;
   	  } else {
            system.debug('No se pudo conectar');
            result='No se pudo conectar a la API';
        }
        return result;
    }
}