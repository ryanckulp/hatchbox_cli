# HatchBox CLI
Unofficial bash script that makes SSH-ing into your server a bit easier. no user data is saved, this lives on your machine.

![hatchbox-cli](https://user-images.githubusercontent.com/3083888/179966310-38f22445-3fc2-4d0e-841b-5a905d7e0448.jpg)

## Usage
the CLI accepts 2 arguments, `app` (HatchBox project slug) and `command` (common server task).

```sh
hb [app] [command]

# examples
hb [app] console # run rails console for [app]
hb [app] logs # tail live logs for [app]

hb help # list available commands
```

## Installation
add the script to your environment and provide a HatchBox server IP.

**Mac**
```sh
# step 1 - copy script to your bash profile
echo "$(curl https://raw.githubusercontent.com/ryanckulp/hatchbox_cli/master/script.sh)" >> ~/.bash_profile
vim ~/.bash_profile

# step 2 - modify script to point to your HatchBox server
# replace "xxx.xxx.xxx.xxx" inside hb() function with your HatchBox server IP (begin insert via 'i')
# save the file (press escape key, then hold down the shift key and press "zz")

# step 3 - refresh your PATH
source ~/.bash_profile

# you're done!
```

**Windows**
i don't know, [tell me how?](https://github.com/ryanckulp/hatchbox_cli/issues/new) :)