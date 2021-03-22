import io.specto.hoverfly.junit.core.HoverflyConfig;
import io.specto.hoverfly.junit.rule.HoverflyRule;
import org.junit.ClassRule;
import org.junit.Test;

public class FirstAttempt {

    @ClassRule
    public static HoverflyRule hoverflyRule = HoverflyRule
            .inCaptureOrSimulationMode("account.json", HoverflyConfig.configs().proxyLocalHost()).printSimulationData();


    @Test
    public void test() {

        assert(true);
    }

}
