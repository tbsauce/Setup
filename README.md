# Setup

This repository helps you set up your XFCE environment and includes some additional tools.

## Execution
Assuming you have a fresh Ubuntu OS installation without any necessary tools, run the following command:

```
sudo apt install -y xfce4
```

1. After completing this step, restart your system.
2. Change to the XFCE layout:
	1. Press your user profile icon.
	2. Click on the settings option in the bottom-right corner.
	3. Choose "XFCE."
3. If you don't have Git installed yet, you can add Neovim using the following command:
    ```
    sudo apt install neovim
    ```
    1. Copy the [init.sh](https://github.com/tbsauce/Setup/blob/main/init.sh) file and execute it with the following command:
    ```
    bash init.sh
    ```
4. If you already have Git installed, simply **run the init.sh** file.

You can run the two scripts (theme and tools) separately, but **remember to reboot your system after** both to ensure proper configuration.