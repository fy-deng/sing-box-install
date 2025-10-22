## [XTLS Vision](https://github.com/XTLS/Xray-core/discussions/1295) 使用 [sing-box](https://github.com/SagerNet/sing-box) 安装指南

## 升级版本时先移除sing-box
仅供已安装后升级版本使用，升级安装sing-box会重置
`/usr/lib/systemd/system/sing-box.service` 、`/usr/lib/systemd/system/sing-box@.service`文件，升级版本建议重新安装

```bash
systemctl stop sing-box.service && apt-get remove -y sing-box
```

## 下载sing-box
以sing-box 1.12.10版本为例：

```bash
wget https://github.com/SagerNet/sing-box/releases/download/v1.12.10/sing-box_1.12.10_linux_amd64.deb
```

```bash
wget https://github.com/SagerNet/sing-box/releases/download/v1.12.10/sing-box_1.12.10_linux_arm64.deb
```

## 生成sing-box md5
`sing-box 1.12.10` 版本：

:. linux-amd64
```bash
md5sum sing-box_1.12.10_linux_amd64.deb 
sha256:05e50cf015d97e86beb08c08b0c529239a875a96de2852727e17ddb47afa3649  sing-box_1.12.10_linux_amd64.deb
```

:. linux-arm64
```bash
md5sum sing-box_1.12.10_linux_arm64.deb 
sha256:976432006bf8596775769eb00f2f5409c656fb9e4a6e8bfb7a6a6ab2346469e1  sing-box_1.12.10_linux_arm64.deb
```

## 安装sing-box
`sing-box 1.12.10` 版本：

:. linux-amd64
```bash
dpkg -i sing-box_1.12.10_linux_amd64.deb && dpkg -c sing-box_1.12.10_linux_amd64.deb
```

:. linux-arm64
```bash
dpkg -i sing-box_1.12.10_linux_amd64.deb && dpkg -c sing-box_1.12.10_linux_arm64.deb
```



## 检查sing-box版本
`sing-box 1.12.10` 版本：

```bash
sing-box version
```

## 增加sing-box用户、用户组
出于安全考虑，以sing-box用户身份运行sing-box

```bash
groupadd --system sing-box
```

```bash
useradd --system \
    --gid sing-box \
    --create-home \
    --home-dir /var/lib/sing-box \
    --shell /usr/sbin/nologin \
    --comment "Sing-box Project" \
    sing-box
```

## 在sing-box.service中增加sing-box用户

`sing-box 1.12.10` 版本：

```bash
sed -i '/\[Service\]/a \
User=sing-box\
Group=sing-box' '/usr/lib/systemd/system/sing-box.service'
```

## 在sing-box@.service中增加sing-box用户

`sing-box 1.12.10` 版本：
```bash
sed -i '/\[Service\]/a \
User=sing-box\
Group=sing-box' '/usr/lib/systemd/system/sing-box@.service'
```

## 创建sing-box IPv4配置文件
如果你的服务器只支持IPv4，用此配置，
执行前先修改"//"里面的内容，替换成你自己的配置

```bash
cat << EOF > /etc/sing-box/config.json
{

}
EOF
```

## 创建sing-box IPv6配置文件
如果你的服务器支持IPv6，用此配置，
执行前先修改"//"里面的内容，替换成你自己的配置
```bash
cat << EOF > /etc/sing-box/config.json
{

}
EOF
```

## 开机自启动sing-box，立即启动sing-box服务，并检查sing-box服务状态
```bash
systemctl enable sing-box && systemctl daemon-reload && systemctl start sing-box.service && systemctl status sing-box.service
```

| 项目     |                                               |
| :------- | :-------------------------------------------- |
| 程序     | **/usr/local/bin/sing-box**                   |
| 配置     | **/etc/sing-box/config.json**                 |
| 服务     | **/urs/lib/systemd/system/sing-box.service**  |
| 检查     | `sing-box check -c /etc/sing-box/config.json` |
| 查看日志 | `journalctl -u sing-box --output cat -e`      |
| 实时日志 | `journalctl -u sing-box --output cat -f`      |
