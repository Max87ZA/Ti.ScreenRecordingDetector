// This is a test harness for your module
// You should do something interesting in this harness
// to test out the module and to provide instructions
// to users on how to use it by example.


// open a single window
const win = Ti.UI.createWindow();

win.open();

// TODO: write your module tests here
var ScreenRecordingDetection = require('sk.maxapp.tiscreenrecordingdetector');

ScreenRecordingDetection.addEventListener('screenRecordingStatusChanged', function(e) {
    if (e.isCaptured) {
        Ti.API.info('Screen recording detected!');
        // Blur sensitive content or show a warning message
    } else {
        Ti.API.info('Screen recording stopped.');
    }
});

var isRecording = ScreenRecordingDetection.isScreenRecording();
Ti.API.info('Is screen recording: ' + isRecording);


