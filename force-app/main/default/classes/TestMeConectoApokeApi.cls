@isTest
public class TestMeConectoApokeApi {
    @isTest public static void reciboRespuesta(){
      singleRequestMock fakeResponse = new singleRequestMock(200,'OK','{"Name":"Hoothoot"}',null);
        
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        test.startTest();
        String result = MeContectoApokeApi.meConecto(163);
       
        test.stopTest();
        System.assertEquals('[{"Name":Hoothoot}]', result,'El assert no funciono');//si la comparacion falla muestro el mensaje
        System.assertNotEquals(null, result,'El assert no funciono');//si la comparacion es igual muestro el mensaje
    }
    
    @isTest public static void noReciboRespuesta(){
        singleRequestMock fakeResponse = new singleRequestMock(401,'ERROR','result',null);
        Test.setMock(HttpCalloutMock.class, fakeResponse);
        test.startTest();
        String result = MeContectoApokeApi.meConecto(163);
        test.stopTest();
        System.assertEquals('No se pudo conectar a la API', result,'El assert no funciono');//si la comparacion falla muestro el mensaje
        System.assertNotEquals(null, result,'El assert no funciono');//si la comparacion es igual muestro el mensaje
        
        
        
    }
}