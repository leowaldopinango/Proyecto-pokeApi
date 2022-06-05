@isTest
public with sharing class TestPokeBatch {
    public static List<Pokemon__c>listPokemon;
      static {
      listPokemon = new List<Pokemon__c>();
      listPokemon.add(new Pokemon__c());
    
    }
    @isTest
    static void testPrimeraGeneracion(){
        singleRequestMock fakeResponse = new singleRequestMock(200,
                                                                'OK',
                                                                '{"abilities": [{"ability": {"name": "overgrow", "url": "https://pokeapi.co/api/v2/ability/65/"}, "is_hidden": false, "slot": 1}], "base_experience": 64, "forms": [{"name": "hoothoot","url": "https://pokeapi.co/api/v2/pokemon-form/1/"}], "game_indices": [{"game_index": 153, "version": {"name": "red", "url": "https://pokeapi.co/api/v2/version/1/"}}], "height": 7, "held_items": [], "id":55, "is_default": true, "location_area_encounters": "https://pokeapi.co/api/v2/pokemon/1/encounters", "moves": [{"move": {"name": "razor-wind", "url": "https://pokeapi.co/api/v2/move/13/"}}], "name": "hoothoot", "order": 260, "past_type":[], "species":{"name": "hoothoot", "url": "https://pokeapi.co/api/v2/pokemon-species/163/"}, "sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png"}, "stats":[{"base_stat": 45, "effort": 0, "stat":{"name": "hp"}}], "types": [{"slot": 1, "type": {"name": "normal", "url": "https://pokeapi.co/api/v2/type/12/"}}, {"slot": 2, "type": {"name": "flying", "url": "https://pokeapi.co/api/v2/type/4/"}}], "weight": 212}',
                                                               null); 
                                                              

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        test.startTest();
        BatchPokemon  pokeTest = new BatchPokemon(listPokemon);
        Database.executeBatch(pokeTest, 1);
        test.stopTest();
         List<Pokemon__c>pokeListTest = [SELECT Name, Foto__c,Peso__c,
                                         Altura__c,Generation__c,Tipo__c,PokeIndex__c//realizo la query y se la asigno a pokemonListTest
                                         FROM Pokemon__c];
        System.assertEquals(pokeListTest[0].Name,'Hoothoot','No coincide'); //comparo y mensaje error
        System.assertEquals(pokeListTest[0].Foto__c,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png','la imagen no es la correcta');
        System.assertEquals(pokeListTest[0].Peso__c, '212 lbs.', 'El peso del pokemon no coincide');
        System.assertEquals(pokeListTest[0].Altura__c, '7 ft.','La altura del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Generation__c, 1,'La generacion del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Tipo__c, 'Normal;Flying','El tipo del pokemon no coindice');
        System.assertEquals(pokeListTest[0].PokeIndex__c, 55,'El indice del pokemon no coindice');
    }

    @isTest
    static void testSegundaGeneracion(){
        singleRequestMock fakeResponse = new singleRequestMock(200,
                                                                'OK',
                                                                '{"abilities": [{"ability": {"name": "overgrow", "url": "https://pokeapi.co/api/v2/ability/65/"}, "is_hidden": false, "slot": 1}], "base_experience": 64, "forms": [{"name": "hoothoot","url": "https://pokeapi.co/api/v2/pokemon-form/1/"}], "game_indices": [{"game_index": 153, "version": {"name": "red", "url": "https://pokeapi.co/api/v2/version/1/"}}], "height": 7, "held_items": [], "id":163, "is_default": true, "location_area_encounters": "https://pokeapi.co/api/v2/pokemon/1/encounters", "moves": [{"move": {"name": "razor-wind", "url": "https://pokeapi.co/api/v2/move/13/"}}], "name": "hoothoot", "order": 260, "past_type":[], "species":{"name": "hoothoot", "url": "https://pokeapi.co/api/v2/pokemon-species/163/"}, "sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png"}, "stats":[{"base_stat": 45, "effort": 0, "stat":{"name": "hp"}}], "types": [{"slot": 1, "type": {"name": "normal", "url": "https://pokeapi.co/api/v2/type/12/"}}, {"slot": 2, "type": {"name": "flying", "url": "https://pokeapi.co/api/v2/type/4/"}}], "weight": 212}',
                                                               null); 
                                                              

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        test.startTest();
        BatchPokemon  pokeTest = new BatchPokemon(listPokemon);
        Database.executeBatch(pokeTest, 1);
        test.stopTest();
         List<Pokemon__c>pokeListTest = [SELECT Name, Foto__c,Peso__c,
                                         Altura__c,Generation__c,Tipo__c,PokeIndex__c//realizo la query y se la asigno a pokemonListTest
                                         FROM Pokemon__c];
        System.assertEquals(pokeListTest[0].Name,'Hoothoot','No coincide'); //comparo y mensaje error
        System.assertEquals(pokeListTest[0].Foto__c,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png','la imagen no es la correcta');
        System.assertEquals(pokeListTest[0].Peso__c, '212 lbs.', 'El peso del pokemon no coincide');
        System.assertEquals(pokeListTest[0].Altura__c, '7 ft.','La altura del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Generation__c, 2,'La generacion del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Tipo__c, 'Normal;Flying','El tipo del pokemon no coindice');
        System.assertEquals(pokeListTest[0].PokeIndex__c, 163,'El indice del pokemon no coindice');
    }

    @isTest
    static void testTerceraGeneracion(){
        singleRequestMock fakeResponse = new singleRequestMock(200,
                                                                'OK',
                                                                '{"abilities": [{"ability": {"name": "overgrow", "url": "https://pokeapi.co/api/v2/ability/65/"}, "is_hidden": false, "slot": 1}], "base_experience": 64, "forms": [{"name": "hoothoot","url": "https://pokeapi.co/api/v2/pokemon-form/1/"}], "game_indices": [{"game_index": 153, "version": {"name": "red", "url": "https://pokeapi.co/api/v2/version/1/"}}], "height": 7, "held_items": [], "id":300, "is_default": true, "location_area_encounters": "https://pokeapi.co/api/v2/pokemon/1/encounters", "moves": [{"move": {"name": "razor-wind", "url": "https://pokeapi.co/api/v2/move/13/"}}], "name": "hoothoot", "order": 260, "past_type":[], "species":{"name": "hoothoot", "url": "https://pokeapi.co/api/v2/pokemon-species/163/"}, "sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png"}, "stats":[{"base_stat": 45, "effort": 0, "stat":{"name": "hp"}}], "types": [{"slot": 1, "type": {"name": "normal", "url": "https://pokeapi.co/api/v2/type/12/"}}, {"slot": 2, "type": {"name": "flying", "url": "https://pokeapi.co/api/v2/type/4/"}}], "weight": 212}',
                                                               null); 
                                                              

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        test.startTest();
        BatchPokemon  pokeTest = new BatchPokemon(listPokemon);
        Database.executeBatch(pokeTest, 1);
        test.stopTest();
         List<Pokemon__c>pokeListTest = [SELECT Name, Foto__c,Peso__c,
                                         Altura__c,Generation__c,Tipo__c,PokeIndex__c//realizo la query y se la asigno a pokemonListTest
                                         FROM Pokemon__c];
        System.assertEquals(pokeListTest[0].Name,'Hoothoot','No coincide'); //comparo y mensaje error
        System.assertEquals(pokeListTest[0].Foto__c,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png','la imagen no es la correcta');
        System.assertEquals(pokeListTest[0].Peso__c, '212 lbs.', 'El peso del pokemon no coincide');
        System.assertEquals(pokeListTest[0].Altura__c, '7 ft.','La altura del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Generation__c, 3,'La generacion del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Tipo__c, 'Normal;Flying','El tipo del pokemon no coindice');
        System.assertEquals(pokeListTest[0].PokeIndex__c, 300,'El indice del pokemon no coindice');
    }

    @isTest
    static void testCuartaGeneracion(){
        singleRequestMock fakeResponse = new singleRequestMock(200,
                                                                'OK',
                                                                '{"abilities": [{"ability": {"name": "overgrow", "url": "https://pokeapi.co/api/v2/ability/65/"}, "is_hidden": false, "slot": 1}], "base_experience": 64, "forms": [{"name": "hoothoot","url": "https://pokeapi.co/api/v2/pokemon-form/1/"}], "game_indices": [{"game_index": 153, "version": {"name": "red", "url": "https://pokeapi.co/api/v2/version/1/"}}], "height": 7, "held_items": [], "id":400, "is_default": true, "location_area_encounters": "https://pokeapi.co/api/v2/pokemon/1/encounters", "moves": [{"move": {"name": "razor-wind", "url": "https://pokeapi.co/api/v2/move/13/"}}], "name": "hoothoot", "order": 260, "past_type":[], "species":{"name": "hoothoot", "url": "https://pokeapi.co/api/v2/pokemon-species/163/"}, "sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png"}, "stats":[{"base_stat": 45, "effort": 0, "stat":{"name": "hp"}}], "types": [{"slot": 1, "type": {"name": "normal", "url": "https://pokeapi.co/api/v2/type/12/"}}, {"slot": 2, "type": {"name": "flying", "url": "https://pokeapi.co/api/v2/type/4/"}}], "weight": 212}',
                                                               null); 
                                                              

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        test.startTest();
        BatchPokemon  pokeTest = new BatchPokemon(listPokemon);
        Database.executeBatch(pokeTest, 1);
        test.stopTest();
         List<Pokemon__c>pokeListTest = [SELECT Name, Foto__c,Peso__c,
                                         Altura__c,Generation__c,Tipo__c,PokeIndex__c//realizo la query y se la asigno a pokemonListTest
                                         FROM Pokemon__c];
        System.assertEquals(pokeListTest[0].Name,'Hoothoot','No coincide'); //comparo y mensaje error
        System.assertEquals(pokeListTest[0].Foto__c,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png','la imagen no es la correcta');
        System.assertEquals(pokeListTest[0].Peso__c, '212 lbs.', 'El peso del pokemon no coincide');
        System.assertEquals(pokeListTest[0].Altura__c, '7 ft.','La altura del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Generation__c, 4,'La generacion del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Tipo__c, 'Normal;Flying','El tipo del pokemon no coindice');
        System.assertEquals(pokeListTest[0].PokeIndex__c, 400,'El indice del pokemon no coindice');
    }

       @isTest
    static void testQuintaGeneracion(){
        singleRequestMock fakeResponse = new singleRequestMock(200,
                                                                'OK',
                                                                '{"abilities": [{"ability": {"name": "overgrow", "url": "https://pokeapi.co/api/v2/ability/65/"}, "is_hidden": false, "slot": 1}], "base_experience": 64, "forms": [{"name": "hoothoot","url": "https://pokeapi.co/api/v2/pokemon-form/1/"}], "game_indices": [{"game_index": 153, "version": {"name": "red", "url": "https://pokeapi.co/api/v2/version/1/"}}], "height": 7, "held_items": [], "id":600, "is_default": true, "location_area_encounters": "https://pokeapi.co/api/v2/pokemon/1/encounters", "moves": [{"move": {"name": "razor-wind", "url": "https://pokeapi.co/api/v2/move/13/"}}], "name": "hoothoot", "order": 260, "past_type":[], "species":{"name": "hoothoot", "url": "https://pokeapi.co/api/v2/pokemon-species/163/"}, "sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png"}, "stats":[{"base_stat": 45, "effort": 0, "stat":{"name": "hp"}}], "types": [{"slot": 1, "type": {"name": "normal", "url": "https://pokeapi.co/api/v2/type/12/"}}, {"slot": 2, "type": {"name": "flying", "url": "https://pokeapi.co/api/v2/type/4/"}}], "weight": 212}',
                                                               null); 
                                                              

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        test.startTest();
        BatchPokemon  pokeTest = new BatchPokemon(listPokemon);
        Database.executeBatch(pokeTest, 1);
        test.stopTest();
         List<Pokemon__c>pokeListTest = [SELECT Name, Foto__c,Peso__c,
                                         Altura__c,Generation__c,Tipo__c,PokeIndex__c//realizo la query y se la asigno a pokemonListTest
                                         FROM Pokemon__c];
        System.assertEquals(pokeListTest[0].Name,'Hoothoot','No coincide'); //comparo y mensaje error
        System.assertEquals(pokeListTest[0].Foto__c,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png','la imagen no es la correcta');
        System.assertEquals(pokeListTest[0].Peso__c, '212 lbs.', 'El peso del pokemon no coincide');
        System.assertEquals(pokeListTest[0].Altura__c, '7 ft.','La altura del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Generation__c, 5,'La generacion del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Tipo__c, 'Normal;Flying','El tipo del pokemon no coindice');
        System.assertEquals(pokeListTest[0].PokeIndex__c, 600,'El indice del pokemon no coindice');
    }
       @isTest
    static void testSextaGeneracion(){
        singleRequestMock fakeResponse = new singleRequestMock(200,
                                                                'OK',
                                                                '{"abilities": [{"ability": {"name": "overgrow", "url": "https://pokeapi.co/api/v2/ability/65/"}, "is_hidden": false, "slot": 1}], "base_experience": 64, "forms": [{"name": "hoothoot","url": "https://pokeapi.co/api/v2/pokemon-form/1/"}], "game_indices": [{"game_index": 153, "version": {"name": "red", "url": "https://pokeapi.co/api/v2/version/1/"}}], "height": 7, "held_items": [], "id":700, "is_default": true, "location_area_encounters": "https://pokeapi.co/api/v2/pokemon/1/encounters", "moves": [{"move": {"name": "razor-wind", "url": "https://pokeapi.co/api/v2/move/13/"}}], "name": "hoothoot", "order": 260, "past_type":[], "species":{"name": "hoothoot", "url": "https://pokeapi.co/api/v2/pokemon-species/163/"}, "sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png"}, "stats":[{"base_stat": 45, "effort": 0, "stat":{"name": "hp"}}], "types": [{"slot": 1, "type": {"name": "normal", "url": "https://pokeapi.co/api/v2/type/12/"}}, {"slot": 2, "type": {"name": "flying", "url": "https://pokeapi.co/api/v2/type/4/"}}], "weight": 212}',
                                                               null); 
                                                              

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        test.startTest();
        BatchPokemon  pokeTest = new BatchPokemon(listPokemon);
        Database.executeBatch(pokeTest, 1);
        test.stopTest();
         List<Pokemon__c>pokeListTest = [SELECT Name, Foto__c,Peso__c,
                                         Altura__c,Generation__c,Tipo__c,PokeIndex__c//realizo la query y se la asigno a pokemonListTest
                                         FROM Pokemon__c];
        System.assertEquals(pokeListTest[0].Name,'Hoothoot','No coincide'); //comparo y mensaje error
        System.assertEquals(pokeListTest[0].Foto__c,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png','la imagen no es la correcta');
        System.assertEquals(pokeListTest[0].Peso__c, '212 lbs.', 'El peso del pokemon no coincide');
        System.assertEquals(pokeListTest[0].Altura__c, '7 ft.','La altura del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Generation__c, 6,'La generacion del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Tipo__c, 'Normal;Flying','El tipo del pokemon no coindice');
        System.assertEquals(pokeListTest[0].PokeIndex__c, 700,'El indice del pokemon no coindice');
    }

     @isTest
    static void testSeptimaGeneracion(){
        singleRequestMock fakeResponse = new singleRequestMock(200,
                                                                'OK',
                                                                '{"abilities": [{"ability": {"name": "overgrow", "url": "https://pokeapi.co/api/v2/ability/65/"}, "is_hidden": false, "slot": 1}], "base_experience": 64, "forms": [{"name": "hoothoot","url": "https://pokeapi.co/api/v2/pokemon-form/1/"}], "game_indices": [{"game_index": 153, "version": {"name": "red", "url": "https://pokeapi.co/api/v2/version/1/"}}], "height": 7, "held_items": [], "id":800, "is_default": true, "location_area_encounters": "https://pokeapi.co/api/v2/pokemon/1/encounters", "moves": [{"move": {"name": "razor-wind", "url": "https://pokeapi.co/api/v2/move/13/"}}], "name": "hoothoot", "order": 260, "past_type":[], "species":{"name": "hoothoot", "url": "https://pokeapi.co/api/v2/pokemon-species/163/"}, "sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png"}, "stats":[{"base_stat": 45, "effort": 0, "stat":{"name": "hp"}}], "types": [{"slot": 1, "type": {"name": "normal", "url": "https://pokeapi.co/api/v2/type/12/"}}, {"slot": 2, "type": {"name": "flying", "url": "https://pokeapi.co/api/v2/type/4/"}}], "weight": 212}',
                                                               null); 
                                                              

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        test.startTest();
        BatchPokemon  pokeTest = new BatchPokemon(listPokemon);
        Database.executeBatch(pokeTest, 1);
        test.stopTest();
         List<Pokemon__c>pokeListTest = [SELECT Name, Foto__c,Peso__c,
                                         Altura__c,Generation__c,Tipo__c,PokeIndex__c//realizo la query y se la asigno a pokemonListTest
                                         FROM Pokemon__c];
        System.assertEquals(pokeListTest[0].Name,'Hoothoot','No coincide'); //comparo y mensaje error
        System.assertEquals(pokeListTest[0].Foto__c,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png','la imagen no es la correcta');
        System.assertEquals(pokeListTest[0].Peso__c, '212 lbs.', 'El peso del pokemon no coincide');
        System.assertEquals(pokeListTest[0].Altura__c, '7 ft.','La altura del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Generation__c, 7,'La generacion del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Tipo__c, 'Normal;Flying','El tipo del pokemon no coindice');
        System.assertEquals(pokeListTest[0].PokeIndex__c, 800,'El indice del pokemon no coindice');
    }

        @isTest
    static void testOctavaGeneracion(){
        singleRequestMock fakeResponse = new singleRequestMock(200,
                                                                'OK',
                                                                '{"abilities": [{"ability": {"name": "overgrow", "url": "https://pokeapi.co/api/v2/ability/65/"}, "is_hidden": false, "slot": 1}], "base_experience": 64, "forms": [{"name": "hoothoot","url": "https://pokeapi.co/api/v2/pokemon-form/1/"}], "game_indices": [{"game_index": 153, "version": {"name": "red", "url": "https://pokeapi.co/api/v2/version/1/"}}], "height": 7, "held_items": [], "id":850, "is_default": true, "location_area_encounters": "https://pokeapi.co/api/v2/pokemon/1/encounters", "moves": [{"move": {"name": "razor-wind", "url": "https://pokeapi.co/api/v2/move/13/"}}], "name": "hoothoot", "order": 260, "past_type":[], "species":{"name": "hoothoot", "url": "https://pokeapi.co/api/v2/pokemon-species/163/"}, "sprites":{"front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png"}, "stats":[{"base_stat": 45, "effort": 0, "stat":{"name": "hp"}}], "types": [{"slot": 1, "type": {"name": "normal", "url": "https://pokeapi.co/api/v2/type/12/"}}, {"slot": 2, "type": {"name": "flying", "url": "https://pokeapi.co/api/v2/type/4/"}}], "weight": 212}',
                                                               null); 
                                                              

        Test.setMock(HttpCalloutMock.class, fakeResponse);
        test.startTest();
        BatchPokemon  pokeTest = new BatchPokemon(listPokemon);
        Database.executeBatch(pokeTest, 1);
        test.stopTest();
         List<Pokemon__c>pokeListTest = [SELECT Name, Foto__c,Peso__c,
                                         Altura__c,Generation__c,Tipo__c,PokeIndex__c//realizo la query y se la asigno a pokemonListTest
                                         FROM Pokemon__c];
        System.assertEquals(pokeListTest[0].Name,'Hoothoot','No coincide'); //comparo y mensaje error
        System.assertEquals(pokeListTest[0].Foto__c,'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/163.png','la imagen no es la correcta');
        System.assertEquals(pokeListTest[0].Peso__c, '212 lbs.', 'El peso del pokemon no coincide');
        System.assertEquals(pokeListTest[0].Altura__c, '7 ft.','La altura del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Generation__c, 8,'La generacion del pokemon no coindice');
        System.assertEquals(pokeListTest[0].Tipo__c, 'Normal;Flying','El tipo del pokemon no coindice');
        System.assertEquals(pokeListTest[0].PokeIndex__c, 850,'El indice del pokemon no coindice');
    }
     @isTest
     static void noInsertDataPokemons(){
        singleRequestMock fakeResponse = new singleRequestMock(401,
                                                             'ERROR',
                                                             'Lo siento la App no esta funcionando',
                                                             null);
       
      
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        Test.startTest();
        BatchPokemon  pokeTest = new BatchPokemon(listPokemon);
        Database.executeBatch(pokeTest, 1);
        Test.stopTest();

        List<Pokemon__c>pokeListTest = [SELECT Name, Foto__c,PokeIndex__c,Peso__c //realizo la query y se la asigno a pokemonListTest
                                            FROM Pokemon__c]; //indico desde donde realizo la consulta en este caso mi Pokemon__c Custom

        System.assertEquals(0,pokeListTest.size(),'No se deberian de poder insertar pokemons');                                    
     }
}