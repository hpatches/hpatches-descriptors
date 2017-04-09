![logo](../utils/imgs/hpatch.png "logo") 
## Extracting and saving descriptors from patches

### Descriptor files format

The evaluation protocol expects a `.csv` file per `.png` image, with
`N` rows and `D` columns, where `N` is the number of patches in the
sequence, and `D` is the descriptor dimensionality.

For example, the `v_dogman\ref.png` image is of size `100x65`, thus it
consists of 100/65=2 patches. It follows that a valid descriptor `.csv`
file for this image, would consist of 2 rows.

### Computing descriptors: templates for several programming languages

We provide examples for several languages, together with guides on how
to use template to extract a trivial descriptor from the images with
the patch collections. 

* [c++](c++/readme.md)
* [python](python/readme.md)
* [torch (lua)](torch/readme.md)
* [matlab](matlab/readme.md)

Please check the individual readme files for language-specific information.

Note that `HPatch` also supports `packed` descriptors which are
`openCV` binary descriptors that are saved as `uchars`. In that case,
the number of columns will be `D/8`.
