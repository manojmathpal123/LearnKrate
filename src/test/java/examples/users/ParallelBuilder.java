package examples.users;

import org.junit.jupiter.api.Test;
import com.intuit.karate.Runner.Builder;

public class ParallelBuilder {


    @Test
    public void Executekaratetest()
    {
     Builder arunner = new Builder();
     arunner.path("classpath:getrequest");

    }
}
