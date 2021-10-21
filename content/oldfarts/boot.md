---
title: "Booting the system"
date: 2021-10-14T17:31:07+01:00
draft: false
---

Booting computers _got complicated_ (or, appeared to) in around 20xx, when the first systems came onto the market that supported booting via the "UEFI" mechanism instead of the legacy "BIOS" mechanism.

<!--more-->

# How it worked before...

In 2021, most[^1] modern computers provide a firmware interface (sometimes still called "the BIOS" despite _everything_ and usually selectable on bootup by holding down some combination of keys on startup), which offers some choices on bootup.

The one that is most pertinent to this post is the selection between "Legacy" or "CSM" bios boot and UEFI boot.

# BIOS Boot

Traditional BIOS boot works as follows when the computer starts up:

1. The motherboard's built-in firmware completes a set of hardcoded power-on tests, then checks its internal memory to look up the saved "boot device" which the user has previously selected. This is usually configured as a unique, ordered set of devices.
2. The motherboard finds the first item in the list of devices which is currently connected to the system, and analyses its [partition table](https://en.wikipedia.org/wiki/Master_boot_record) to find the first partition which has its `Boot` flag set
3. The BIOS loads a 

# UEFI Boot

When a system is configured in UEFI mode, the process is as follows:

## ESP Partition Discovery

The firmware searches all the connected storage devices which have GPT partition tables for a partition which has the specific GPT partition label UUID

[^1]: specifically not Apple computers or some "fancy" laptops
