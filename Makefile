IMAGE_NAME=RancherOS-deb

packer: clean
	#PACKER_LOG_PATH=./packer.log PACKER_LOG=1 sudo packer build packer-rancher.json
	docker run -it -v $(PWD):/work -w /work  --privileged -e PACKER_LOG=1 -e PACKER_LOG_PATH=/work/packer.log packer-qemu build packer-rancher.json

glance: packer
	glance image-create --name $(IMAGE_NAME) --container-format bare   --disk-format qcow2   --file  output_rancher/rancheros  --is-public True

clean:
	sudo rm -rf *.iso packer_cache/ output_rancher/ *.log

docker-image:
	docker build -t packer-qemu .
