=begin
Launcher uses the properties specified here to launch the application
=end

#{{{ Fixture Properties
fixture_properties = {
        'marathon.project.launcher.model' => "com.jaliansystems.marathonite.launchers.webstart.WebstartLauncherModel",
        'marathon.webstart.jnlp.url' => "http://10.125.4.132/aws2uaters02b.jnlp",
        'marathon.webstart.options' => "",
        'marathon.webstart.nosplash' => "false",
        'marathon.webstart.offline' => "false",
        'marathon.recorder.namingstrategy' => "net.sourceforge.marathon.objectmap.ObjectMapNamingStrategy",
        'marathon.application.start.window' => "",
        'marathon.application.extra.jar' => "",
        'marathon.application.classpath' => "",
        'marathon.fixture.reuse' => ""
    }
#}}} Fixture Properties

=begin
Default Fixture
=end

class Fixture

=begin
    Marathon executes this method at the end of test script.
=end

    def teardown
        
    end

=begin
    Marathon executes this method before the test script.
=end

    def setup
    end

=begin
    Marathon executes this method after the first window of the application is displayed.
    You can add any Marathon script elements here.
=end

    def test_setup
        
    end

end

$fixture = Fixture.new
