# motionpro-proxy-vnc-desktop

## Intro

A vnc desktop container for [motionpro](https://www.arrayguard.com/MotionPro.asp).

Since motionpro doesn't support rule-based vpn, use this container makes it possible to traffic limited flows to vpn.

## Usage

To use it, you should:

Download motionpro client ubuntu version and move it to `res` folder and rename to `MotionProInstaller.sh`. Here is an example to donwload 9.0.4.x:

```bash
wget https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/pkg_9_4_0_505/MP_Linux_1.2.18/MotionPro_Linux_Ubuntu_x64_build-8383-34.sh -O MotionProInstaller.sh
```

To use other versions, you can go to [this site](https://support.arraynetworks.net/prx/001/http/supportportal.arraynetworks.net/downloads/downloads.html) to get download url.

Then, create `env.sh` and add some env vars:

```bash
# env.sh
export rootPasswd="your password for root user of container."
export proxyHost="your proxy host"
```

Then, just:

```bash
./up-service.sh --build
```

After this, you can use `./get-ipv4.sh` to get the ipv4 address of the container, then you can traffic flows to container.

## Thanks

* [w0o0ps/motion-pro-vpn-client](https://github.com/w0o0ps/motion-pro-vpn-client) for example of MotionPro container example.
* [cherryservers blog](https://www.cherryservers.com/blog/ssh-into-docker-container) for help of ssh to container.
* [YXHXianYu - docker-ubuntu-vnc-desktop](https://github.com/YXHXianYu/docker-ubuntu-vnc-desktop) for example of vnc.
