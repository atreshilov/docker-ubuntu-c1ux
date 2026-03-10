# SAIC-GM 2020-2023 Chevy Equinox Car Media Reverse Engineering Toolbox

Ubuntu-based toolbox with `mc`, `apktool`, `apksigner`, etc. for reverse
engineering the Chevy Equinox car media system.

## Helper scripts

Helper scripts are placed in `/root/bin`. `/root/bin` is included in the `PATH`
environment variable, so you can run the following scripts from anywhere inside
the container:

`mount.sh` 

Mount external image file `./_temp_/my_sparse.img` to `/mnt/img` inside the container. 
Remove excessive Chineese APKs from the image file to save space.

`unmount.sh` 

Unmount the `/mnt/img` from inside the container. 
Compress the image file with `resize2fs`.

## Helper files

APK signing keys are placed in `/root/certs`:
- `./platform.x509.pem` 
- `./platform.pk8`
