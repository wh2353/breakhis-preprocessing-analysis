# Impact of normalization and data augmentation on Breast Cancer Histopathological Image Classification (BreakHis) using deep learning
Wenrui Huang, Nicolas Echevarrieta-Catalan, Alicia Bilbao-Martinez, Alexander Claman, Daniel Bilbao and Vanessa Aguiar-Pulido

## src/
- Data_augmentation_and_normalization_experiments.ipynb: script on image agumentation and training on ResNet 18, 34, 50, 101 with or without IBN-a or IBN-b normalization.
- image_400x_colornorm.m: MATLAB script on color normalization on 400X images

## results/
- FP-FN outliers/ includes Top 3 most frequent FP or FN classified images (6 in total)
- ResNet18-34_CV_test.xlsx: CV and test results for ResNet 18 and 34 with different normalization and image augmentation methods
- ResNet50_101_CV_test.xlsx: CV and test results for ResNet 50 and 101 with different normalization and image augmentation methods
