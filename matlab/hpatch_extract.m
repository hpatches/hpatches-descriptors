folders = dir('../../hpatch-release');
folders = folders([folders.isdir]);
f = folders(3:end);

% name of the descriptor 
descr_name = 'misigma';

% read all the images into a list
imgs = {};
for i=1:length(f)
  f(i).name;
  f_png = dir([f(i).folder,'/',f(i).name,'/*.png']);
  for k=1:length(f_png)
    imgs{end+1} =  [f(i).folder,'/',f(i).name,'/',f_png(k).name];
  end
end

% loop through all images 
for k=1:length(imgs)
  fname = char(imgs(k));
  C = strsplit(fname,'/');
  name = C{end};
  Nname = length(name);
  fpath = fname(1:end-Nname);
  seqName = C{end-1};
  
  % read the image and split to patches
  im = imread(fname);
  [M,N] = size(im);
  nSub = size(im,1)/65;
  cMat = mat2cell(im,diff(round(linspace(0,M,nSub+1))),N);

  dirname = [descr_name,'/',seqName,'/'];
  if ~exist(dirname, 'dir')
    mkdir(dirname);
  end

  %descriptor matrix size Nx2 (mi,sigma)
  descr = zeros(length(cMat),2);

  % loop through patches and get the descriptor
  for i=1:length(cMat)
    patch = double(cMat{i});
    % replace this part with your descriptor computation method for 'patch'
    mi = mean(patch(:));
    sigma = std(patch(:));
    descr(i,:) = [mi sigma];
  end

  sname = strrep(name, '.png', '.csv');
  disp(['Extracting descriptors for ',seqName,'/',name])
  dlmwrite([descr_name,'/',seqName,'/',sname],descr);

end


