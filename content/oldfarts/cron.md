+++
title="Scheduling Regular Tasks"
date="2021-10-14T17:31:07+01:00"
draft=false
+++

Scheduling tasks is one of the most common tasks that new system adminstrators
find themselves doing, and `cron` is almost always the tool that they'd reach
for.

Cron's been around since the dawn of time, [Wikipedia][wp-cron] has the initial
release as May 1975! The core functionality of cron basically hasn't changed
since then - and for good reason, it's basically fine - it's easy to configure
and does a job, but it only really does the _bare minimum_ of jobs when it comes
to scheduling jobs, often requiring users to use a bunch of tricks and other
tools to be able to actually do useful things (as shown below).

With `systemd` and some other tools, it's now possible to make things a little
easier, and I'll describe how to do some of these in this post.

# The Old Way

Original cron works as follows:

- crond works as a daemon that runs all the time as root. Most of the time, this
  daemon sits idle, waiting for the next event to occur
- There's a main file: `/etc/crontab` into which the root user can add specially
  formatted lines of text, which will cause crond to trigger an executable at a
  certain time. Since these files can only be edited by root, they can be
  configured to run tasks as any systemd user.
- Root can add binaries/scripts/symlinks to executables into a few "preset"
  directories in etc (e.g `/etc/cron.daily`) to cause tasks to run at a specific
  time interval (e.g hourly, daily, weekly, monthly) as root. These don't
  require writing a scheduler line, the system simply calls them at the preset
  interval
- Every user can use the `crontab` tool (or any editor, once the file is
  created) to modify their _own_ crontab, which is stored in
  `/var/spool/cron/<username>`. This allows a user to schedule tasks that run
  jobs as their own user ID using the same syntax as the `/etc/crontab` (but
  omitting the `user` column).

{{< block note >}}
Perhaps the most interesting part of `cron` is its scheduler format - this
allows a user to configure the periodic execution of a task using a text format
which consists of a few text fields, but provides a huge range of flexibility.

{{< /block >}}

Every different kind of cron configuration results in crond running an
executable on disk somewhere - usually a shell script or compiled binary. Cron
will configure the environment for executed commands using some system info and
some configuration from the crontab file.

There's nothing more complicated than this to `cron`. Like many unix
tools, it does just one thing very well, specifically: running a single command
periodically. Anything beyond that has to be configured by the system
administrator as part of the "single command". Although this seems simple at
first, it means that the system administrator's completely on their own when
they want to configure any of the following:

1. Making sure that the command finishes within a reasonable time
2. Making sure that only one iteration of the command runs at once
3. Limiting the resource usage of the executed commands
4. Reducing the privileges of the executed command beyond changing the user that
   it gets executed as
5. Making sure that prerequisite services are running at the time of execution
6. Handling "missed" schedule windows (such as when the machine was turned
   off/asleep)

With `systemd`, `anacron` and other tools, it's possible to make things easier,
and avoid some of the complicated (and sometimes brittle) patterns described below.

# Cron Time Format

This works as follows:

```crontab
# Each line in the file is a different job
#
# Each line consists of:
#  - 5 time fields
#  - A "user" field (omitted in the user-specific crontabs in /var/spool)
#  - A field for the command to execute
#
# Any of the fields can be replaced by an asterisk, meaning "all"
#
# Examples:

# This uses * for every field, which means that this command will be run
# as root, every minute of every day:
* * * * * root /bin/some-frequent-command
# This specifies 0 and 5 in the minute/hour fields, and an asterisk for
# every other field, meaning it'll get executed at 5:00am, every day:
0 5 * * * root /bin/some-daily-command
# Ranges can also be used in the fields, for example this command will
# be run every 5th minute of every _other_ hour, but only on Sunday:
*/5 */2 * * sun root /bin/what-are-you-doing
```

[wp-cron]: https://en.wikipedia.org/wiki/Cron
