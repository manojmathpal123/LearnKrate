package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ParallelBuilder {


    @Test
    public void Executekaratetest()
    {
     Builder arunner = new Builder();
     arunner.path("classpath:com/api/automation");
     arunner.tags("@Smoke");
     Results result = arunner.parallel(5);

     System.out.println("Total Feature" +result.getFeaturesTotal() );
        System.out.println("Total Feature" +result.getScenariosTotal());
        System.out.println("Total Feature" +result.getScenariosPassed() );
        Assertions.assertEquals(0,result.getFailCount(),"there are some failed scenario");


    }
}
