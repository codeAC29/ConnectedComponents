# Connected Components

##

File 8cc.c is a C-script which finds 8-connected components in a given binary image using the traditional 2-pass algorithm. The function definition is as follows:

```
int connectedComponent(int *outputMaskPointer, int *coordinates, int height, int width)
```
Here,
..* `outputMaskPointer` is the binary image in which we need to find the connected components. Keep in mind that this image will get modified after running you call this script with respective labels. Labels created are continuous, i.e. label names will be 1, 2, 3... and it will be never be in the form 1, 3, 4...
..* `coordinates` stores the x-y coordinates of top-left corner and bottom-right corner of a found label. Structure of this array is **Mx4**, where **M** is number of detected labels. While calling this function, you can initialize this array with size **1x4** and then the script will automatically update the size based on number of connected components it detects.
..* `height` and `width` is the height and width of the input binary image respectively.

This script also returns number of detected labels. The input binary image should also be **zero-padded** and the values in `coordinates` are NOT for this padded image (you do not need to do `coordinates - 1`).

In order to generate the binary file Makefile can be used. Type the following command:
```
make
```
to create lib8cc.so file and

```
make clean
```
if you wish to delete the generated `.so` and `.o` files.
