package com.api.automation;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class ParallelBuilderCucumberreport {


    @Test
    public void Executekaratetest()
    {
     Builder arunner = new Builder();
     arunner.path("classpath:com/api/automation");
    
     Results result = arunner.parallel(5);


        GenerateCucumbereport(result.getReportDir());



    }

    private void GenerateCucumbereport(String reportDirLocation)
    {
        File reportDir = new File(reportDirLocation);
        Collection<File> jsoncollection = FileUtils.listFiles(reportDir,new String[]{"json"},true);

        List<String> jsonFiles = new ArrayList<String>();
        jsoncollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
        Configuration configuration = new Configuration(reportDir,"Karate run");
        ReportBuilder reportBuilder = new ReportBuilder(jsonFiles,configuration);
        reportBuilder.generateReports();



    }
}
