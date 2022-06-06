package com.api.automation;

import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

public class ParallelRunner {

    @Test
    public void excutekarateTest()
    {

        //Runner.parallel(getClass(),5);
        Runner.Builder arunner = new Runner.Builder();
        arunner.path("classpath:com/api/automation");
        arunner.tags("@Regression","@Smoke");
        arunner.parallel(5);


    }
}
