## [XTLS Vision](https://github.com/XTLS/Xray-core/discussions/1295) 使用 [sing-box](https://github.com/SagerNet/sing-box) 安装指南

1. 下载程序

:. linux-amd64

```
curl -Lo /root/sb https://github.com/SagerNet/sing-box/releases/download/v1.2.3/sing-box-1.2.3-linux-amd64.tar.gz && tar -xzf /root/sb && cp -f /root/sing-box-*/sing-box /usr/local/bin/ && rm -r /root/sb /root/sing-box-*
```

:. linux-arm64

```
curl -Lo /root/sb https://github.com/SagerNet/sing-box/releases/download/v1.2.3/sing-box-1.2.3-linux-arm64.tar.gz && tar -xzf /root/sb && cp -f /root/sing-box-*/sing-box /usr/local/bin/ && rm -r /root/sb /root/sing-box-*
```

2. 下载配置并更新

```
sudo mkdir -p /var/lib/sing-box && sudo mkdir -p /usr/local/etc/sing-box && curl -Lo /usr/local/etc/sing-box/config.json https://raw.githubusercontent.com/fy-deng/sing-box-insall/diy/config.json
```

3. 下载systemctl配置

```
curl -Lo /etc/systemd/system/sing-box.service https://raw.githubusercontent.com/fy-deng/sing-box-install/diy/sing-box.service && systemctl daemon-reload
```

4. 上传证书和私钥

- 将证书文件改名为 **cert.crt**，将私钥文件改名为 **private.key**，将它们上传到 **/etc/ssl/private/** 目录。

5. 启动程序

```
systemctl enable --now sing-box && sleep 0.2 && systemctl status sing-box
```

| 项目 | |
| :--- | :--- |
| 程序 | **/usr/local/bin/sing-box** |
| 配置 | **/usr/local/etc/sing-box/config.json** |
| 检查 | `sing-box check -c /usr/local/etc/sing-box/config.json` |
| 查看日志 | `journalctl -u sing-box --output cat -e` |
| 实时日志 | `journalctl -u sing-box --output cat -f` |

[**客户端配置示例**](https://github.com/chika0801/sing-box-examples/blob/main/VLESS-XTLS-Vision/config_client.json)
