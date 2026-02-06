# LVM on EC2 (EBS) — Quick Steps

1. Provision and attach EBS volumes to the EC2 instance (example device names: /dev/nvme1n1, /dev/nvme2n1, /dev/nvme3n1).

2. Create physical volumes:
```
sudo pvcreate /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1
```

3. Verify PVs:
```
pvs
sudo pvdisplay /dev/nvme1n1
```

4. Create a volume group:
```
sudo vgcreate tws_vg /dev/nvme1n1 /dev/nvme2n1 /dev/nvme3n1
```

5. Verify VGs:
```
vgs
sudo vgdisplay tws_vg
```

6. Create a logical volume (10 GiB example):
```
sudo lvcreate -L 10G -n tws_lv tws_vg
```

7. Verify LVs:
```
lvs
sudo lvdisplay /dev/tws_vg/tws_lv
```

8. Format the LV (ext4 example) and create mount point:
```
sudo mkfs.ext4 /dev/tws_vg/tws_lv
sudo mkdir -p /mnt/tws_lv_mount
```

9. Mount and verify:
```
sudo mount /dev/tws_vg/tws_lv /mnt/tws_lv_mount
lsblk
df -h
```

10. To format a raw disk directly (no LVM):
```
sudo mkfs.ext4 /dev/nvme3n1
sudo mount /dev/nvme3n1 /mnt/some_mount
```

11. Extend the LV by 5 GiB and grow the filesystem (ext4 example):
```
sudo lvextend -L +5G /dev/tws_vg/tws_lv
sudo resize2fs /dev/tws_vg/tws_lv
```

12. Re-verify after extension:
```
lsblk
lvs
df -h
```

Notes:
- Replace device names and VG/LV names as needed.
- Use appropriate grow command for other filesystems (e.g., xfs_growfs for XFS).
- Run commands with sudo if not root.
- Ensure EBS volumes are detached/attached properly in the AWS console if device names differ.
