dataPath = strcat(filePath,'\',fileLoad);
openFaceData = readtable(dataPath); %reads processed CSV file

fileBadFrameCount = 0;

faceNumber = length(unique(openFaceData.face_id)) - 1;
faceNumberString = sprintf('There are a total of %d faces detected in this video.',faceNumber+1); %Declares number of faces detected in processed video
disp(faceNumberString)

for faceCount = 0:faceNumber
  badFrame = 0;
  totalReferenceWidth = 0;
  totalReferenceLength = 0;
  openFaceDataFiltered = openFaceData(openFaceData.face_id == faceCount,:);
  for i = 1:length(openFaceDataFiltered.frame) %Begin ClassifierCall-like code
      x_mat = [openFaceDataFiltered.x_1(i) openFaceDataFiltered.x_2(i) openFaceDataFiltered.x_3(i) openFaceDataFiltered.x_4(i) openFaceDataFiltered.x_5(i) openFaceDataFiltered.x_6(i) openFaceDataFiltered.x_7(i) openFaceDataFiltered.x_8(i) openFaceDataFiltered.x_9(i) openFaceDataFiltered.x_10(i) openFaceDataFiltered.x_11(i) openFaceDataFiltered.x_12(i) openFaceDataFiltered.x_13(i) openFaceDataFiltered.x_14(i) openFaceDataFiltered.x_15(i) openFaceDataFiltered.x_16(i) openFaceDataFiltered.x_17(i) openFaceDataFiltered.x_18(i) openFaceDataFiltered.x_19(i) openFaceDataFiltered.x_20(i) openFaceDataFiltered.x_21(i) openFaceDataFiltered.x_22(i) openFaceDataFiltered.x_23(i) openFaceDataFiltered.x_24(i) openFaceDataFiltered.x_25(i) openFaceDataFiltered.x_26(i) openFaceDataFiltered.x_27(i) openFaceDataFiltered.x_28(i) openFaceDataFiltered.x_29(i) openFaceDataFiltered.x_30(i) openFaceDataFiltered.x_31(i) openFaceDataFiltered.x_32(i) openFaceDataFiltered.x_33(i) openFaceDataFiltered.x_34(i) openFaceDataFiltered.x_35(i) openFaceDataFiltered.x_36(i) openFaceDataFiltered.x_37(i) openFaceDataFiltered.x_38(i) openFaceDataFiltered.x_39(i) openFaceDataFiltered.x_40(i) openFaceDataFiltered.x_41(i) openFaceDataFiltered.x_42(i) openFaceDataFiltered.x_43(i) openFaceDataFiltered.x_44(i) openFaceDataFiltered.x_45(i) openFaceDataFiltered.x_46(i) openFaceDataFiltered.x_47(i) openFaceDataFiltered.x_48(i) openFaceDataFiltered.x_49(i) openFaceDataFiltered.x_50(i) openFaceDataFiltered.x_51(i) openFaceDataFiltered.x_52(i) openFaceDataFiltered.x_53(i) openFaceDataFiltered.x_54(i) openFaceDataFiltered.x_55(i) openFaceDataFiltered.x_56(i) openFaceDataFiltered.x_57(i) openFaceDataFiltered.x_58(i) openFaceDataFiltered.x_59(i) openFaceDataFiltered.x_60(i) openFaceDataFiltered.x_61(i) openFaceDataFiltered.x_62(i) openFaceDataFiltered.x_63(i) openFaceDataFiltered.x_64(i) openFaceDataFiltered.x_65(i) openFaceDataFiltered.x_66(i) openFaceDataFiltered.x_67(i)];

      x_matMax = max(x_mat);
      x_matMin = min(x_mat);
      
      referenceWidth = x_matMax - x_matMin;
      totalReferenceWidth = totalReferenceWidth + referenceWidth;
      
      y_mat = [openFaceDataFiltered.y_1(i) openFaceDataFiltered.y_2(i) openFaceDataFiltered.y_3(i) openFaceDataFiltered.y_4(i) openFaceDataFiltered.y_5(i) openFaceDataFiltered.y_6(i) openFaceDataFiltered.y_7(i) openFaceDataFiltered.y_8(i) openFaceDataFiltered.y_9(i) openFaceDataFiltered.y_10(i) openFaceDataFiltered.y_11(i) openFaceDataFiltered.y_12(i) openFaceDataFiltered.y_13(i) openFaceDataFiltered.y_14(i) openFaceDataFiltered.y_15(i) openFaceDataFiltered.y_16(i) openFaceDataFiltered.y_17(i) openFaceDataFiltered.y_18(i) openFaceDataFiltered.y_19(i) openFaceDataFiltered.y_20(i) openFaceDataFiltered.y_21(i) openFaceDataFiltered.y_22(i) openFaceDataFiltered.y_23(i) openFaceDataFiltered.y_24(i) openFaceDataFiltered.y_25(i) openFaceDataFiltered.y_26(i) openFaceDataFiltered.y_27(i) openFaceDataFiltered.y_28(i) openFaceDataFiltered.y_29(i) openFaceDataFiltered.y_30(i) openFaceDataFiltered.y_31(i) openFaceDataFiltered.y_32(i) openFaceDataFiltered.y_33(i) openFaceDataFiltered.y_34(i) openFaceDataFiltered.y_35(i) openFaceDataFiltered.y_36(i) openFaceDataFiltered.y_37(i) openFaceDataFiltered.y_38(i) openFaceDataFiltered.y_39(i) openFaceDataFiltered.y_40(i) openFaceDataFiltered.y_41(i) openFaceDataFiltered.y_42(i) openFaceDataFiltered.y_43(i) openFaceDataFiltered.y_44(i) openFaceDataFiltered.y_45(i) openFaceDataFiltered.y_46(i) openFaceDataFiltered.y_47(i) openFaceDataFiltered.y_48(i) openFaceDataFiltered.y_49(i) openFaceDataFiltered.y_50(i) openFaceDataFiltered.y_51(i) openFaceDataFiltered.y_52(i) openFaceDataFiltered.y_53(i) openFaceDataFiltered.y_54(i) openFaceDataFiltered.y_55(i) openFaceDataFiltered.y_56(i) openFaceDataFiltered.y_57(i) openFaceDataFiltered.y_58(i) openFaceDataFiltered.y_59(i) openFaceDataFiltered.y_60(i) openFaceDataFiltered.y_61(i) openFaceDataFiltered.y_62(i) openFaceDataFiltered.y_63(i) openFaceDataFiltered.y_64(i) openFaceDataFiltered.y_65(i) openFaceDataFiltered.y_66(i) openFaceDataFiltered.y_67(i)];
      
      y_matMax = max(y_mat);
      y_matMin = min(y_mat);
      
      referenceLength = y_matMax - y_matMin;
      totalReferenceLength = totalReferenceLength + referenceLength;
   end
  averageReferenceWidth = totalReferenceWidth/length(openFaceDataFiltered.frame);
  averageReferenceLength = totalReferenceLength/length(openFaceDataFiltered.frame);

  averageReferenceArea = averageReferenceWidth*averageReferenceLength;

  for i = 1:length(openFaceDataFiltered.frame)
    xFrame_mat = [openFaceDataFiltered.x_1(i) openFaceDataFiltered.x_2(i) openFaceDataFiltered.x_3(i) openFaceDataFiltered.x_4(i) openFaceDataFiltered.x_5(i) openFaceDataFiltered.x_6(i) openFaceDataFiltered.x_7(i) openFaceDataFiltered.x_8(i) openFaceDataFiltered.x_9(i) openFaceDataFiltered.x_10(i) openFaceDataFiltered.x_11(i) openFaceDataFiltered.x_12(i) openFaceDataFiltered.x_13(i) openFaceDataFiltered.x_14(i) openFaceDataFiltered.x_15(i) openFaceDataFiltered.x_16(i) openFaceDataFiltered.x_17(i) openFaceDataFiltered.x_18(i) openFaceDataFiltered.x_19(i) openFaceDataFiltered.x_20(i) openFaceDataFiltered.x_21(i) openFaceDataFiltered.x_22(i) openFaceDataFiltered.x_23(i) openFaceDataFiltered.x_24(i) openFaceDataFiltered.x_25(i) openFaceDataFiltered.x_26(i) openFaceDataFiltered.x_27(i) openFaceDataFiltered.x_28(i) openFaceDataFiltered.x_29(i) openFaceDataFiltered.x_30(i) openFaceDataFiltered.x_31(i) openFaceDataFiltered.x_32(i) openFaceDataFiltered.x_33(i) openFaceDataFiltered.x_34(i) openFaceDataFiltered.x_35(i) openFaceDataFiltered.x_36(i) openFaceDataFiltered.x_37(i) openFaceDataFiltered.x_38(i) openFaceDataFiltered.x_39(i) openFaceDataFiltered.x_40(i) openFaceDataFiltered.x_41(i) openFaceDataFiltered.x_42(i) openFaceDataFiltered.x_43(i) openFaceDataFiltered.x_44(i) openFaceDataFiltered.x_45(i) openFaceDataFiltered.x_46(i) openFaceDataFiltered.x_47(i) openFaceDataFiltered.x_48(i) openFaceDataFiltered.x_49(i) openFaceDataFiltered.x_50(i) openFaceDataFiltered.x_51(i) openFaceDataFiltered.x_52(i) openFaceDataFiltered.x_53(i) openFaceDataFiltered.x_54(i) openFaceDataFiltered.x_55(i) openFaceDataFiltered.x_56(i) openFaceDataFiltered.x_57(i) openFaceDataFiltered.x_58(i) openFaceDataFiltered.x_59(i) openFaceDataFiltered.x_60(i) openFaceDataFiltered.x_61(i) openFaceDataFiltered.x_62(i) openFaceDataFiltered.x_63(i) openFaceDataFiltered.x_64(i) openFaceDataFiltered.x_65(i) openFaceDataFiltered.x_66(i) openFaceDataFiltered.x_67(i)];

    xFrame_matMax = max(xFrame_mat);
    xFrame_matMin = min(xFrame_mat);
      
    frameFaceWidth = xFrame_matMax - xFrame_matMin;
      
    yFrame_mat = [openFaceDataFiltered.y_1(i) openFaceDataFiltered.y_2(i) openFaceDataFiltered.y_3(i) openFaceDataFiltered.y_4(i) openFaceDataFiltered.y_5(i) openFaceDataFiltered.y_6(i) openFaceDataFiltered.y_7(i) openFaceDataFiltered.y_8(i) openFaceDataFiltered.y_9(i) openFaceDataFiltered.y_10(i) openFaceDataFiltered.y_11(i) openFaceDataFiltered.y_12(i) openFaceDataFiltered.y_13(i) openFaceDataFiltered.y_14(i) openFaceDataFiltered.y_15(i) openFaceDataFiltered.y_16(i) openFaceDataFiltered.y_17(i) openFaceDataFiltered.y_18(i) openFaceDataFiltered.y_19(i) openFaceDataFiltered.y_20(i) openFaceDataFiltered.y_21(i) openFaceDataFiltered.y_22(i) openFaceDataFiltered.y_23(i) openFaceDataFiltered.y_24(i) openFaceDataFiltered.y_25(i) openFaceDataFiltered.y_26(i) openFaceDataFiltered.y_27(i) openFaceDataFiltered.y_28(i) openFaceDataFiltered.y_29(i) openFaceDataFiltered.y_30(i) openFaceDataFiltered.y_31(i) openFaceDataFiltered.y_32(i) openFaceDataFiltered.y_33(i) openFaceDataFiltered.y_34(i) openFaceDataFiltered.y_35(i) openFaceDataFiltered.y_36(i) openFaceDataFiltered.y_37(i) openFaceDataFiltered.y_38(i) openFaceDataFiltered.y_39(i) openFaceDataFiltered.y_40(i) openFaceDataFiltered.y_41(i) openFaceDataFiltered.y_42(i) openFaceDataFiltered.y_43(i) openFaceDataFiltered.y_44(i) openFaceDataFiltered.y_45(i) openFaceDataFiltered.y_46(i) openFaceDataFiltered.y_47(i) openFaceDataFiltered.y_48(i) openFaceDataFiltered.y_49(i) openFaceDataFiltered.y_50(i) openFaceDataFiltered.y_51(i) openFaceDataFiltered.y_52(i) openFaceDataFiltered.y_53(i) openFaceDataFiltered.y_54(i) openFaceDataFiltered.y_55(i) openFaceDataFiltered.y_56(i) openFaceDataFiltered.y_57(i) openFaceDataFiltered.y_58(i) openFaceDataFiltered.y_59(i) openFaceDataFiltered.y_60(i) openFaceDataFiltered.y_61(i) openFaceDataFiltered.y_62(i) openFaceDataFiltered.y_63(i) openFaceDataFiltered.y_64(i) openFaceDataFiltered.y_65(i) openFaceDataFiltered.y_66(i) openFaceDataFiltered.y_67(i)];
      
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

  fileBadFrameCount = fileBadFrameCount + badFrame;
  localFrameCountString = num2str(length(openFaceDataFiltered.frame));
  badFrameCountString = num2str(badFrame);
  localErrorRate = badFrame/length(openFaceDataFiltered.frame)*100;
  localErrorRateString = num2str(localErrorRate);
  faceThresholdString = num2str(faceThreshold);

  endResultString = sprintf('%s processing for Face #%d yielded %d bad frames out of %d total frames. This creates an error rate of %d.%',fileLoad,faceCount,badFrame,length(openFaceDataFiltered.frame),localErrorRate);
  disp(endResultString)
  outputMatrix = [outputMatrix; string(fileLoad), string(faceCount), string(faceThresholdString), string(badFrameCountString), string(localFrameCountString), string(localErrorRateString)]; %["File Name", "Face ID", "Face Threshold", "# of Bad Frames", "# of Frames Analyzed" "Error Rate (%)"];

end