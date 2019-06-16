# OpenFaceFrameDropTools
These executable tools are designed to detect any false-positive frames of valid facial recognition caused by secondary face detection. These tools take OpenFace-generated output CSV files as input and analyzes the facial area of each frame against the size of the average facial area and determines whether a frame's facial area is an outlier per a specified area threshold tolerance.

These executables require the MATLAB Runtime 9.5 (R2018b) to be installed on your machine. You can find the installer for it here:
http://ssd.mathworks.com/supportfiles/downloads/R2018b/deployment_files/R2018b/installers/win64/MCR_R2018b_win64_installer.exe

