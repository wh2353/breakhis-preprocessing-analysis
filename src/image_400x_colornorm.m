% Main file to run different color normalization techniques

clear
clc
close all 
%% Define source and target images (Add target and source images to the folder "images")
% source=imread('images/source1.png');
% target=imread('images/target1.png');
%% Obtain the list of images that needs to be normalized (against he.png as taget)
[status, list_of_pngs] = system("find /Users/WENRUI/Documents/Tumor_image_paper/Normalization/breakhis-analysis/400xData -maxdepth 3 -name *png");
% split by lines
list_of_pngs = splitlines(list_of_pngs);
% remove the last row
list_of_pngs(length(list_of_pngs),:)=[];
% normalize image one by one
for i = 1:size(list_of_pngs)
    img_path = char(list_of_pngs(i,1));
    disp(img_path)
    source=imread(img_path);
    target=imread('images/he.png');
    
    nstains=2;
    % lambda=0.02;  % Use smaller values of the lambda (0.01-0.1) for better reconstruction. however, if the normalized image seems not fine, increase or decrease the value accordingly.
    lambda=0.4
    %% Our Method (The techniques is published in ISBI 2015 under the title "STRUCTURE-PRESERVED COLOR NORMALIZATION FOR HISTOLOGICAL IMAGES")
    % For queries, contact: abhishek.vahadane@gmail.com, vahadane@iitg.ernet.in
    % Source and target stain separation and storage of factors 
    tic
    [Wis, His,Hivs]=stainsep(source,nstains,lambda);
    % save('source.mat','Wis','His','Hivs')
    [Wi, Hi,Hiv]=stainsep(target,nstains,lambda);
    % save('target.mat','Wi','Hi','Hiv')
    
    % Color normlization
    % addpath(genpath('Our Method'))
    [our]=SCN(source,Hi,Wi,His);
    time=toc;
    
    % Write image to a folder
    % get the new file name
    [prefix, postfix] = split(img_path, ".");
    new_img_path = char(prefix(1,1)) + "_norm.png";

    imwrite(our,new_img_path)

end

%% Visuals
figure;
subplot(131);imshow(source);xlabel('source')
subplot(132);imshow(target);xlabel('target')
subplot(133);imshow(our);xlabel('normalized source')