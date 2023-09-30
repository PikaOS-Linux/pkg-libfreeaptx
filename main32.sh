# Clone Upstream
git clone https://github.com/iamthehorker/libfreeaptx
cp -rvf ./debian ./libfreeaptx/
cd ./libfreeaptx

for i in ../patches/*.patch; do patch -Np1 -i $i ;done

LOGNAME=root dh_make --createorig -y -l -p libfreeaptx_0.1.1

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
