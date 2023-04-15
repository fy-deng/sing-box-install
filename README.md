## [XTLS Vision](https://github.com/XTLS/Xray-core/discussions/1295) 使用 [sing-box](https://github.com/SagerNet/sing-box) 安装指南

1. 下载程序并安装

:. linux-amd64

```
curl -Lo /root/sb.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.2.3/sing-box-1.2.3-linux-amd64.tar.gz && \
tar -xzf /root/sb.tar.gz -C /root && \
cp -f /root/sing-box-*/sing-box /usr/local/bin/ && \
rm -rf /root/sb.tar.gz /root/sing-box-*
```

:. linux-arm64

```
curl -Lo /root/sb.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.2.3/sing-box-1.2.3-linux-arm64.tar.gz && \
tar -xzf /root/sb.tar.gz -C /root && \
cp -f /root/sing-box-*/sing-box /usr/local/bin/ && \
rm -rf /root/sb.tar.gz /root/sing-box-*
```

2. 创建配置文件并按需修改

```
sudo mkdir -p /var/lib/sing-box /etc/sing-box && \
curl -Lo /etc/sing-box/config.json https://raw.githubusercontent.com/fy-deng/sing-box-install/diy/config.json
```

3. 下载并配置 systemd

```
curl -Lo /etc/systemd/system/sing-box.service https://raw.githubusercontent.com/fy-deng/sing-box-install/diy/sing-box.service && \
systemctl daemon-reload
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
| 配置 | **/etc/sing-box/config.json** |
| 检查 | `sing-box check -c /etc/sing-box/config.json` |
| 查看日志 | `journalctl -u sing-box --output cat -e` |
| 实时日志 | `journalctl -u sing-box --output cat -f` |

[**客户端配置示例**](https://github.com/chika0801/sing-box-examples/blob/main/VLESS-XTLS-Vision/config_client.json)
