# OpenFace Secondary Frame Drop Detector Tools

"OpenFaceFrameDropTools" is a repository of executable tools written in MATLAB designed to detect false-positive facial recognitions. Whether these false recognitions are caused by a "non-face" object or the facial recognition algorithm assigning a certain FaceID to the incorrect face, these executables will tally any false positives and note the frame numbers of issue.

## Requirements

These executables require the MATLAB Runtime 9.5 (R2018b) to be installed on your Windows machine. You can find the installer for [here.](http://ssd.mathworks.com/supportfiles/downloads/R2018b/deployment_files/R2018b/installers/win64/MCR_R2018b_win64_installer.exe)

## How It Works

The inner-workings of each program are similar in structure, but approach the issue of determining false positives in different ways depending on the number of faces being recognized in a single frame.

### Single Face Secondary Frame Drop
