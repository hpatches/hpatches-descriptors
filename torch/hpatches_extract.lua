require 'xlua'
require 'trepl'
require 'image'
require 'torch'
require 'lfs'
require 'csvigo'

if (#arg)<2 then
   print("Usage th hpatches_extract.lua hpatches_db_root_folder")
   os.exit()
end


-- hard-coded patch-image extention
ext = '.png'

-- descr name
descr_name = 'misigma'

-- folder with sequence-patches to describe (root folder)
patches_folder = arg[2]

-- make the dir with the results
lfs.mkdir(descr_name)

-- loop through the sequences
for seq in lfs.dir(patches_folder) do
   if seq ~= "." and seq ~= ".." and seq ~= "test_set.txt" then
      print("Computing descriptors for sequence: "..seq)
      lfs.mkdir(descr_name.."/"..seq)
      for file in paths.files(patches_folder..seq) do
	 if file:find(ext .. '$') then
	    -- hpatches image, compute the descriptors
	    local img = image.load(patches_folder..seq.."/"..file,1)
	    -- split the patches-image to patches
	    patches = img:split(65,2)
	    file = io.open (descr_name.."/"..seq.."/"..string.gsub(file,'.png','')..".csv","w")
	    for i,p in ipairs(patches) do 
	       patch = patches[i]:mul(255):float()
	       mi = torch.mean(patch)
	       sigma = torch.std(patch)
	       file:write(mi..','..sigma..'\n')
	    end
	    file:close()
	 end
      end
   end
end
