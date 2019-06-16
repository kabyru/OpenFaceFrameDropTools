%Using the average as the reference frame and the min/max points as the frame face
%Next step: add CSV generating capability to ClassifierCall

dataPath = strcat(filePath,'\',fileLoad);
openFaceData = readtable(dataPath);
badFrame = 0;
totalReferenceWidth = 0;
totalReferenceLength = 0;
outputMatrix = ["File Name", "Face Threshold", "# of Bad Frames", "# of Frames Analyzed", "Error Rate (%)"];

%Calculating the reference frame Data
for i = 1:length(openFaceData.frame)
  x_mat = [openFaceData.x_1(i) openFaceData.x_2(i) openFaceData.x_3(i) openFaceData.x_4(i) openFaceData.x_5(i) openFaceData.x_6(i) openFaceData.x_7(i) openFaceData.x_8(i) openFaceData.x_9(i) openFaceData.x_10(i) openFaceData.x_11(i) openFaceData.x_12(i) openFaceData.x_13(i) openFaceData.x_14(i) openFaceData.x_15(i) openFaceData.x_16(i) openFaceData.x_17(i) openFaceData.x_18(i) openFaceData.x_19(i) openFaceData.x_20(i) openFaceData.x_21(i) openFaceData.x_22(i) openFaceData.x_23(i) openFaceData.x_24(i) openFaceData.x_25(i) openFaceData.x_26(i) openFaceData.x_27(i) openFaceData.x_28(i) openFaceData.x_29(i) openFaceData.x_30(i) openFaceData.x_31(i) openFaceData.x_32(i) openFaceData.x_33(i) openFaceData.x_34(i) openFaceData.x_35(i) openFaceData.x_36(i) openFaceData.x_37(i) openFaceData.x_38(i) openFaceData.x_39(i) openFaceData.x_40(i) openFaceData.x_41(i) openFaceData.x_42(i) openFaceData.x_43(i) openFaceData.x_44(i) openFaceData.x_45(i) openFaceData.x_46(i) openFaceData.x_47(i) openFaceData.x_48(i) openFaceData.x_49(i) openFaceData.x_50(i) openFaceData.x_51(i) openFaceData.x_52(i) openFaceData.x_53(i) openFaceData.x_54(i) openFaceData.x_55(i) openFaceData.x_56(i) openFaceData.x_57(i) openFaceData.x_58(i) openFaceData.x_59(i) openFaceData.x_60(i) openFaceData.x_61(i) openFaceData.x_62(i) openFaceData.x_63(i) openFaceData.x_64(i) openFaceData.x_65(i) openFaceData.x_66(i) openFaceData.x_67(i)];

  x_matMax = max(x_mat);
  x_matMin = min(x_mat);

  referenceWidth = x_matMax - x_matMin;
  totalReferenceWidth = totalReferenceWidth + referenceWidth;

  y_mat = [openFaceData.y_1(i) openFaceData.y_2(i) openFaceData.y_3(i) openFaceData.y_4(i) openFaceData.y_5(i) openFaceData.y_6(i) openFaceData.y_7(i) openFaceData.y_8(i) openFaceData.y_9(i) openFaceData.y_10(i) openFaceData.y_11(i) openFaceData.y_12(i) openFaceData.y_13(i) openFaceData.y_14(i) openFaceData.y_15(i) openFaceData.y_16(i) openFaceData.y_17(i) openFaceData.y_18(i) openFaceData.y_19(i) openFaceData.y_20(i) openFaceData.y_21(i) openFaceData.y_22(i) openFaceData.y_23(i) openFaceData.y_24(i) openFaceData.y_25(i) openFaceData.y_26(i) openFaceData.y_27(i) openFaceData.y_28(i) openFaceData.y_29(i) openFaceData.y_30(i) openFaceData.y_31(i) openFaceData.y_32(i) openFaceData.y_33(i) openFaceData.y_34(i) openFaceData.y_35(i) openFaceData.y_36(i) openFaceData.y_37(i) openFaceData.y_38(i) openFaceData.y_39(i) openFaceData.y_40(i) openFaceData.y_41(i) openFaceData.y_42(i) openFaceData.y_43(i) openFaceData.y_44(i) openFaceData.y_45(i) openFaceData.y_46(i) openFaceData.y_47(i) openFaceData.y_48(i) openFaceData.y_49(i) openFaceData.y_50(i) openFaceData.y_51(i) openFaceData.y_52(i) openFaceData.y_53(i) openFaceData.y_54(i) openFaceData.y_55(i) openFaceData.y_56(i) openFaceData.y_57(i) openFaceData.y_58(i) openFaceData.y_59(i) openFaceData.y_60(i) openFaceData.y_61(i) openFaceData.y_62(i) openFaceData.y_63(i) openFaceData.y_64(i) openFaceData.y_65(i) openFaceData.y_66(i) openFaceData.y_67(i)];

  y_matMax = max(y_mat);
  y_matMin = min(y_mat);

  referenceLength = y_matMax - y_matMin;
  totalReferenceLength = totalReferenceLength + referenceLength;

end

averageReferenceWidth = totalReferenceWidth/length(openFaceData.frame);
averageReferenceLength = totalReferenceLength/length(openFaceData.frame);

averageReferenceArea = averageReferenceWidth * averageReferenceLength; %Reference Area to use

%Determine per frame face area

for i = 1:length(openFaceData.frame)
  xFrame_mat = [openFaceData.x_1(i) openFaceData.x_2(i) openFaceData.x_3(i) openFaceData.x_4(i) openFaceData.x_5(i) openFaceData.x_6(i) openFaceData.x_7(i) openFaceData.x_8(i) openFaceData.x_9(i) openFaceData.x_10(i) openFaceData.x_11(i) openFaceData.x_12(i) openFaceData.x_13(i) openFaceData.x_14(i) openFaceData.x_15(i) openFaceData.x_16(i) openFaceData.x_17(i) openFaceData.x_18(i) openFaceData.x_19(i) openFaceData.x_20(i) openFaceData.x_21(i) openFaceData.x_22(i) openFaceData.x_23(i) openFaceData.x_24(i) openFaceData.x_25(i) openFaceData.x_26(i) openFaceData.x_27(i) openFaceData.x_28(i) openFaceData.x_29(i) openFaceData.x_30(i) openFaceData.x_31(i) openFaceData.x_32(i) openFaceData.x_33(i) openFaceData.x_34(i) openFaceData.x_35(i) openFaceData.x_36(i) openFaceData.x_37(i) openFaceData.x_38(i) openFaceData.x_39(i) openFaceData.x_40(i) openFaceData.x_41(i) openFaceData.x_42(i) openFaceData.x_43(i) openFaceData.x_44(i) openFaceData.x_45(i) openFaceData.x_46(i) openFaceData.x_47(i) openFaceData.x_48(i) openFaceData.x_49(i) openFaceData.x_50(i) openFaceData.x_51(i) openFaceData.x_52(i) openFaceData.x_53(i) openFaceData.x_54(i) openFaceData.x_55(i) openFaceData.x_56(i) openFaceData.x_57(i) openFaceData.x_58(i) openFaceData.x_59(i) openFaceData.x_60(i) openFaceData.x_61(i) openFaceData.x_62(i) openFaceData.x_63(i) openFaceData.x_64(i) openFaceData.x_65(i) openFaceData.x_66(i) openFaceData.x_67(i)];

  xFrame_matMax = max(xFrame_mat);
  xFrame_matMin = min(xFrame_mat);

  frameFaceWidth = xFrame_matMax - xFrame_matMin;

  yFrame_mat = [openFaceData.y_1(i) openFaceData.y_2(i) openFaceData.y_3(i) openFaceData.y_4(i) openFaceData.y_5(i) openFaceData.y_6(i) openFaceData.y_7(i) openFaceData.y_8(i) openFaceData.y_9(i) openFaceData.y_10(i) openFaceData.y_11(i) openFaceData.y_12(i) openFaceData.y_13(i) openFaceData.y_14(i) openFaceData.y_15(i) openFaceData.y_16(i) openFaceData.y_17(i) openFaceData.y_18(i) openFaceData.y_19(i) openFaceData.y_20(i) openFaceData.y_21(i) openFaceData.y_22(i) openFaceData.y_23(i) openFaceData.y_24(i) openFaceData.y_25(i) openFaceData.y_26(i) openFaceData.y_27(i) openFaceData.y_28(i) openFaceData.y_29(i) openFaceData.y_30(i) openFaceData.y_31(i) openFaceData.y_32(i) openFaceData.y_33(i) openFaceData.y_34(i) openFaceData.y_35(i) openFaceData.y_36(i) openFaceData.y_37(i) openFaceData.y_38(i) openFaceData.y_39(i) openFaceData.y_40(i) openFaceData.y_41(i) openFaceData.y_42(i) openFaceData.y_43(i) openFaceData.y_44(i) openFaceData.y_45(i) openFaceData.y_46(i) openFaceData.y_47(i) openFaceData.y_48(i) openFaceData.y_49(i) openFaceData.y_50(i) openFaceData.y_51(i) openFaceData.y_52(i) openFaceData.y_53(i) openFaceData.y_54(i) openFaceData.y_55(i) openFaceData.y_56(i) openFaceData.y_57(i) openFaceData.y_58(i) openFaceData.y_59(i) openFaceData.y_60(i) openFaceData.y_61(i) openFaceData.y_62(i) openFaceData.y_63(i) openFaceData.y_64(i) openFaceData.y_65(i) openFaceData.y_66(i) openFaceData.y_67(i)];

  yFrame_matMax = max(yFrame_mat);
  yFrame_matMin = min(yFrame_mat);

  frameFaceLength = yFrame_matMax - yFrame_matMin;

  frameFaceArea = frameFaceWidth * frameFaceLength;

  %Compare frame face area to reference frame (currently determined as average face frame)

  compareReferenceArea = faceThreshold * averageReferenceArea; %This is the MAIN PARAMETER

  if (frameFaceArea < compareReferenceArea)
    badFrame = badFrame + 1;
    %disp(i)
  end
end

totalBadFrame = totalBadFrame + badFrame;
totalFrame = totalFrame + length(openFaceData.frame);
endResult = '%s processing yielded %d bad frames from secondary face detection.';
processingResult = sprintf(endResult,fileLoad,badFrame)

badFrameString = num2str(badFrame);
localFrameCountString = num2str(length(openFaceData.frame));
localErrorRate = badFrame/length(openFaceData.frame)*100;
localErrorRateString = num2str(localErrorRate);
faceThresholdString = num2str(faceThreshold);


outputMatrix = [outputMatrix; string(fileLoad), string(faceThresholdString), string(badFrameString), string(localFrameCountString), string(localErrorRateString)]; %["File Name", "Face Threshold", "# of Bad Frames", "# of Frames Analyzed", "Error Rate (%)"];
