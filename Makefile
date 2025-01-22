# Copyright Cartesi and individual authors (see AUTHORS)
# SPDX-License-Identifier: Apache-2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

EXTRA_BLOCKS := 4096 # 16MB of free space

build: rootfs-ubuntu.ext2 rootfs-alpine.ext2 ## Build rootfs image

%.ext2: %.tar
	xgenext2fs -fzB 4096 -i 4096 -r +$(EXTRA_BLOCKS) -a $< -L rootfs $@

%.tar: %.Dockerfile
	docker buildx build \
		--platform linux/riscv64 \
	 	--output type=tar,dest=$@ \
	 	--file $< .

clean: ## Remove rootfs image
	rm -f *.tar *.ext2

help: ## Show this help
	@sed \
		-e '/^[a-zA-Z0-9_\-]*:.*##/!d' \
		-e 's/:.*##\s*/:/' \
		-e 's/^\(.\+\):\(.*\)/$(shell tput setaf 6)\1$(shell tput sgr0):\2/' \
		$(MAKEFILE_LIST) | column -c2 -t -s :

.PHONY: build clean help
