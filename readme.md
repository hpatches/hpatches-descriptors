![logo](https://hpatches.github.io/assets/hpatches-logo.png "logo") 
## Extracting and saving descriptors from HPatches sequences

### Descriptor files format

The HPatches evaluation protocol expects a `.csv` file per `.png`
image, with `N` rows and `D` columns, where `N` is the number of
patches in the sequence, and `D` is the descriptor dimensionality.

For example, the `v_dogman\ref.png` image is of size `100x65`, thus it
consists of 100/65=2 patches. It follows that a valid descriptor
`.csv` file for this image, would consist of 2 rows.

### Computing descriptors: templates for several programming languages

We provide examples for several languages, together with guides on how
to use template to extract a trivial descriptor from the images with
the patch collections. 

* [c++](c++/readme.md)
* [python](python/readme.md)
* [torch (lua)](torch/readme.md)
* [matlab](matlab/readme.md)

Please check the individual readme files for language-specific information.

### Computing descriptors: published baselines

In the folder `baselines` we collect several example implementations
of computing descriptors for HPatches sequences, for previously
published baseline descriptors.
