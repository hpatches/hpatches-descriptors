![logo](https://hpatches.github.io/assets/hpatches-logo.png "logo") 
## Extracting and saving descriptors from HPatches dataset - Matlab

Sample code that shows how to extract descriptors from the HPatches
dataset using Matlab.

### How to run
```sh
matlab -nodesktop
>> hpatches_extract(hpatches_db_root_folder)
```

where `hpatches_db_root_folder` points to the folder of the downloaded
[HPatches dataset](https://github.com/hpatches/hpatches-dataset).


After the program ends, you will have folder named `misigma`
containing the descriptor values for the trivial (&#956;,&#963;)
descriptor.
