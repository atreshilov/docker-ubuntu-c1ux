# SAIC-GM 2020-2023 Chevrolet Car Media Reverse Engineering Toolbox

Ubuntu-based toolbox with `mc`, `apktool`, `apksigner`, etc. for reverse
engineering the Chevy Equinox car media system.

## Workflow

### Start

1. Unpack the firmware file: `tar -xvf system.img.tar`
2. Place the extracted `_temp_/my_sparse.img` into `[project_directory]/_temp_/my_sparse.img`
3. Run `./start.sh` in `[project_directory]` to start the container.

### Modify the image files

Use [Helper scripts](#helper-scripts-inside-the-container) to modify the image files.

- The image file contents are mounted to `/mnt/img` inside the container. Do your work there.
- Use the shared `/mnt/disk` directory to transfer files between the host and the container.
- Use `unpack.sh` and `pack.sh` helper scripts to modify the APK application files.
- Run the `shrink.sh` helper script when you are finished. But call `unmount.sh` first.

### Pack the modified image file

1. Pack the modified image file with: `tar -cSf system.img.tar ./_temp_/my_sparse.img`
2. Calculate the MD5 checksum of the modified image file with: `md5 -q _temp_/my_sparse.img > system.md5`
3. Calculate the MD5 checksum of the modified archive with: `md5 -q system.img.tar > system.img.tar.md5sum`

## Helper scripts inside the container

Helper scripts are placed in `/root/bin`. This directory is included in the `PATH`
environment variable, so you can run the following scripts from anywhere inside
the container.

`unpack.sh [apk_file]`
Unpack APK application files to the `./app-src` directory. This is the first step before
modifying the APK files.

`pack.sh [apk_file]`
Pack the modified files in the `./app-src` directory back into an APK application file and sign it with `apksigner`.
This is the final step after modifying the APK files.

`mount.sh` (called automatically when starting the container)

Mount the external image file `[project_directory]/_temp_/my_sparse.img` to `/mnt/img` inside
the container. Also remove excessive Chinese APKs from the image file.

`unmount.sh` (called automatically when exiting the container)

Unmount `/mnt/img` from inside the container.

`shrink.sh`

Resize the image file with `resize2fs` to the minimum possible size. This is the final step before packing
the modified image file with `tar`. You can run this script after you finish modifying the files in the
image file. This will reduce the size of the image file and make it easier to pack with `tar`.

`unshrink.sh`

Similar to the above, but conversely, this script will resize the image file up to 1GB.
This will ensure that you have enough space to modify the files in the image file.