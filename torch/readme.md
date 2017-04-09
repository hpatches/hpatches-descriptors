![logo](https://hpatches.github.io/assets/hpatches-logo.png "logo") 
## Extracting and saving descriptors from HPatches dataset - Torch (Lua)

### Requirements
Download (if needed) the required components to run the example

```sh
luarocks install csvigo
luarocks install lfs
```

### Compile and run

To compile and run the example, run the following

```sh 
th hpatch_extract.lua hpatches_db_root_folder
```


where `hpatches_db_root_folder` points to the folder of the downloaded
[HPatches dataset](https://github.com/hpatches/hpatches-dataset).

After the program ends, you will have folder named `misigma`
containing the descriptor values for the trivial (&#956;,&#963;)
descriptor.


