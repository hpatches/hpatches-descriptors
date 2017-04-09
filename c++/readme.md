![logo](../../utils/imgs/hpatch.png "logo") 
## Extracting and saving descriptors from patches - C++

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
./hpatch_extract
```

After the program ends, you will have folder named `misigma`
containing the descriptor values for the trivial (&#956;,&#963;)
descriptor.
