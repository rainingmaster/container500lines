# Changes

* `seccomp.h`, also inlcude `linux/seccomp.h`. Also, `sudo apt-get install -y
  libseccomp-dev`

* `sys/capability.h` was not found until after `sudo apt-get install -y
  libcap-dev`

* There seems to be a thing about `CLONE_NEWCGROUP`. The macro is defined in
  `linux/sched.h` but not in `sched.h`. This also seems to be a 4.6 and greater
  feature.

* `linux/sched.h` only has cloning flags but not `clone()` declaration.

```
 contained.c:487:29: error: ‘SCMP_FAIL’ undeclared (first use in this function)
      || seccomp_rule_add(ctx, SCMP_FAIL, SCMP_SYS(chmod), 1,
 ```

 also see this [website](https://blog.lizzie.io/linux-containers-in-500-loc.html)
