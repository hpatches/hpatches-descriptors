![logo](https://hpatches.github.io/assets/hpatches-logo.png "logo") 
## Extracting and saving descriptors from HPatches sequences
This repository, contains examples on how to extract descriptors from sequences of the  [HPatches dataset](https://github.com/hpatches/hpatches-dataset).

### Descriptor files format

The HPatches evaluation protocol expects a `.csv` file per `.png`
image, with `N` rows and `D` columns, where `N` is the number of
patches in the sequence, and `D` is the descriptor dimensionality.

For example, the `v_dogman\ref.png` image is of size `38350x65`, thus it
consists of `38350/65=590` patches. It follows that a valid descriptor
`.csv` file for this image, would consist of `590` rows.

### Computing descriptors: templates for several programming languages

We provide examples for several languages, together with guides on how
to use template to extract the trivial (&#956;,&#963;) descriptor from
`HPatches`.

* [c++](c++/readme.md)
* [python](python/readme.md)
* [torch (lua)](torch/readme.md)
* [matlab](matlab/readme.md)

Please check the individual readme files for language-specific information.

### Computing descriptors: published baselines [WIP]

In the folder `baselines` we collect several example implementations
of computing descriptors for HPatches sequences, for previously
published baseline descriptors.
