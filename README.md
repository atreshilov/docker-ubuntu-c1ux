# SAIC-GM 2020-2023 Chevy Equinox Car Media Reverse Engineering Toolbox

Ubuntu-based toolbox with `mc`, `apktool`, `apksigner`, etc. for reverse
engineering the Chevy Equinox car media system.

Prequisites:
1. Place the sparse image file of the car media system in the following location:
`[project_directory]/_temp_/my_sparse.img`
2. Run `./start.sh` in `[project_directory]` to start the container.
3. The image file will be mounted to `/mnt/img` inside the container.
You can access the files in the image file through `/mnt/img`.

## Helper scripts inside the container

Helper scripts are placed in `/root/bin`. `/root/bin` is included in the `PATH`
environment variable, so you can run the following scripts from anywhere inside
the container:

`mount.sh` (called automatically on start container)

Mount external image file `[project_directory]/_temp_/my_sparse.img` to `/mnt/img` inside
the container. Remove excessive Chineese APKs from the image file to save space.

`unmount.sh` (called automatically on exit container)

Unmount the `/mnt/img` from inside the container. 
Compress the image file with `resize2fs`.

## Helper files inside the container

APK signing keys are placed in `/root/certs`:
- `./platform.x509.pem` 
- `./platform.pk8`
