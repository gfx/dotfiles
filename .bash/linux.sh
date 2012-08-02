#!bash
# Linux-specific resources

# for performance (on Linux)
if [ -e /dev/cgroup ] ; then
    mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
    echo $$ > /dev/cgroup/cpu/user/$$/tasks
    echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
fi

