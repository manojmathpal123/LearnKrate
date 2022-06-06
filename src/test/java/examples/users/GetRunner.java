package examples.users;

import com.intuit.karate.junit5.Karate;

public class GetRunner {

    @Karate.Test
    public Karate runtest()
    {
        return Karate.run("getrequest","postrequest","Crudoperation").tags("~@ignore").relativeTo(getClass());

    }
}
