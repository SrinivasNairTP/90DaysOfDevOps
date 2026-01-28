Kernel is the heart of Linux that manages system and hardware resources
User space where applications are run with limited previliges
systemd init system that control services and boot processes

Boot flow
BIOS->Boot Loader->Kernel loads into memory->Kernel starts systemd->systemd starts services->user gets login prompt

A process is program in execution
states inlclude create->ready->running->sleeping->stopped->zombie->terminated

commands like ps,top,jobs helps to monitor process

systemd is the first user space process started bt kernel - pid1
controls system boot,services,logging and state

daily commands to be used
ps a,ps aux,top, systmctl start/stop/status,grep

