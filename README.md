# SAIC-GM 2020-2023 Chevy Equinox Car Media Reverse Engineering Toolbox

Ubuntu-based toolbox with `mc`, `apktool`, `apksigner`, etc. for reverse
engineering the Chevy Equinox car media system.

## Workflow

### Start

1. Unpack the firmware file `tar -xvf system.img.tar`
2. Place the extracted `_temp_/my_sparse.img` to `[project_directory]/_temp_/my_sparse.img`
3. Run `./start.sh` in `[project_directory]` to start the container.

### Modify the image files
 
- The image file contents mounted to `/mnt/img` inside the container. Do your work there.
- Use shared `/mnt/disk` to transfer files between the host and the container. 
- Start helper script `shrink.sh` script when you finished. But call `unmount.sh` first.

### Pack the modified image file

1. Pack the modified image file with `tar -cSf system.img.tar ./_temp_/my_sparse.img`
2. Calculate md5 checksum of the modified image file with `md5 -q _temp_/my_sparse.img > system.md5`.
3. Calculate md5 checksum the modified archive `md5 -q system.img.tar > system.img.tar.md5sum` 

## Helper scripts inside the container

Helper scripts are placed in `/root/bin`. It is included in the `PATH`
environment variable, so you can run the following scripts from anywhere inside
the container.

`mount.sh` (called automatically on start container)

Mount external image file `[project_directory]/_temp_/my_sparse.img` to `/mnt/img` inside
the container. Also remove excessive Chinese APKs from the image file.

`unmount.sh` (called automatically on exit container)

Unmount the `/mnt/img` mounted inside the container.

`shrink.sh`

Resize the image file with `resize2fs` to the minimum possible size. This is the final step before packing
the modified image file with `tar`. You can run this script after you finish modifying the files in the
image file. This will reduce the size of the image file and make it easier to pack with `tar`.

`unshrink.sh`

Same as above, but on the contrary, this script will resize the image file up to 1GB.
This will ensure that you have enough space to modify the files in the image file.
