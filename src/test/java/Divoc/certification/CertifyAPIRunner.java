package Divoc.certification;


import com.intuit.karate.junit4.Karate;
import org.junit.runner.RunWith;
import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import Divoc.ExtentReport.CustomExtentReport;
import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit4.Karate;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import com.intuit.karate.Runner.Builder;


import static org.junit.Assert.assertTrue;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


//@RunWith(Karate.class)
@KarateOptions(tags = {"~@ignore"})
// important: do not use @RunWith(Karate.class) !
public class CertifyAPIRunner {
    @BeforeClass
    public static void beforeClass() throws Exception {
        //TestBase.beforeClass();
    }

    @Test
    public void testParallel() {
         Builder aRunner = new Builder();
        aRunner.path("classpath:Divoc/certification");
        Results results = aRunner.parallel(5);
        
        //Extent Report
        CustomExtentReport extentReport = new CustomExtentReport()
                .withKarateResult(results)
                .withReportDir(results.getReportDir())
                .withReportTitle("Karate Test Execution Report");
        extentReport.generateExtentReport();
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "Divoc");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }


}
