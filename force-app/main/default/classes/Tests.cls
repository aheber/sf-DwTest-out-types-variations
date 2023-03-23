@IsTest
public class Tests {
    @IsTest
    static void testJsonOutput(){
        String payload = getJsonPayload();
        Dataweave.Script script = Dataweave.Script.createScript('SimpleJson');
        Map<String, Object> parameters = new Map<String, Object>();
        parameters.put('payload', payload);
        DataWeave.Result result = script.execute(parameters);
        String jsonOutput = (String)result.getValue();
    }

    @IsTest
    static void testClassedOutput(){
        String payload = getJsonPayload();
        Dataweave.Script script = Dataweave.Script.createScript('SimpleClass');
        Map<String, Object> parameters = new Map<String, Object>();
        parameters.put('payload', payload);
        DataWeave.Result result = script.execute(parameters);
        List<OutShape> output = (List<OutShape>)result.getValue();
    }

    @IsTest
    static void testRawJsonHandling(){
        String payload = getJsonPayload();
        List<OutShape> output = (List<OutShape>)JSON.deserialize(payload, List<OutShape>.class);
    }

    static String getJsonPayload(){
        List<OutShape> output = new List<OutShape>();
        for(Integer i = 0; i< 100; i++){
            output.add(getOutShape());
        }
        return JSON.serialize(output);
    }

    static OutShape getOutShape(){
        OutShape s = new OutShape();
        s.testId = 'testid123';
        s.name = 'This is a test';
        s.dVal = 123.456;
        s.iVal = 987;
        return s;
    }
}