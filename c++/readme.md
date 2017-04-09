![logo](https://hpatches.github.io/assets/hpatches-logo.png "logo") 
## Extracting and saving descriptors from HPatches dataset - C++

### Requirements
Download (if needed) the required components to compile the example

```sh
sudo apt-get install cmake libopencv-dev python-opencv libboost-filesystem-dev libboost-system-dev
```

The requirements are 

- boost filesystem libs
- boost system libs
- opencv 

### Compile and run

To compile and run the example, run the following

```sh 
cmake . 
make 
./hpatches_extract hpatches_db_root_folder
```

where `hpatches_db_root_folder` points to the folder of the downloaded
[HPatches dataset](https://github.com/hpatches/hpatches-dataset).

After the program ends, you will have folder named `misigma`
containing the descriptor values for the trivial (&#956;,&#963;)
descriptor.
