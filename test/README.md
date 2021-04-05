# Running UI Test with cucumber

Cucumber-gherkin is a powerful tool to give a context to test script.
Using Given-When-Then syntax we can quickly get a context what the test try to achieve.

A picture below is an example how to invoke and running the test via terminal:
![Terminal Invoke](https://raw.githubusercontent.com/aditya-setyadi/gallery/muna/flutter-test/test/terminalRunning.png)

We can invoke the test using this command:
```bash
dart test_driver/app_test.dart
```

Before running the command make sure the workstation connect with device/emulator has been started inside the workstation.

Demo when the test running in the emulator:
![Test Running](https://raw.githubusercontent.com/aditya-setyadi/gallery/muna/flutter-test/test/testRunning.gif)

##How would set up the structure to fit automated tests in SDLC in ScrumBan
The ideal way all the changes must be passed the test.
The current structure can be use for the SDLC process it is have a clear separation between test code and feature code.
All the test code live in test folder (feature file and the step definition file) and the instrumentation life in test_driver.

It is a good way to have a joined repository. All team member can help them self when need to change something.

###Note on the flutter the process
- It is a bold move to choose flutter.
- I also found some note when doing a testing. This is maybe the limitation of the time to do the exploratory and colleague to discuss.
    - I cannot manage to retrieve the state of the element (view state, selected state)
    - It is hard to do a simple thing like get a test from label element
- Basic understanding and tutorial flutter I follow from this: https://flutter.dev/
- Using gherkin from here: https://pub.dev/packages/flutter_gherkin
- Some challenging I face:
    - solving version conflict between the dart package.
    - platform selection, in the late time I realize that browser not really work well.
    - Set up. When setting up flutter my connection not really civil with me so downloading around 1GB-ish really take time.
