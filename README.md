Blender Crowd Renderfarm
=========

Designed for Ubuntu 18.04, sorry other OS's or Ref's are not supported at this time.

This role was designed for a packer build process to generate blender render node AMIs

As of right now:

* Installs Blender 2.81a
* Installs CrowdRender 2.2
* Adds CR2.2 to blender configuration
* Starts CR headless server

Also Installs:
* unzip
* libglu1
* libxi6
* libxrender1
  
Help Wanted / TODO
-----------

* Ansible side
  * Multi-OS support (`awsGPU: true`, etc)
* Blender-side
  * enabling CUDA/OpenCL if toggle is on

Requirements
------------

* Ubuntu 18.04
* Strong internet connection

Role Variables
--------------

Note: I have not tested if you can safely mix and match these variables, honestly this role was designed for a specific installation which places blender in `/home/$USER/blender` and crowdrender in `.config/blender/{{blender.version}}/scripts/addons`


* localTesting
  * Used by vagrant for local runs
* servicePath
  * path to install the systemd UNIT file
  * default `/etc/systemd/system`
* serviceSuffix
  * suffix for systemd unit file
  * default `service`
* awsGPU
  * NOT IMPLEMENTED
  * Toggle for whether to configure AWS P-series support (CUDA?)
  * default `false`
* blender
  * version
    * Should match the version used in directory paths
    * default `2.81`
  * source
    * Download source for this version of blender (linux x86_64 archived)
  * checksum
    * NOT IMPLEMENTED yet
* crowdRender
  * relativePath
    * Installation path for crowd render
    * default `.config/blender/{{blender.version}}/scripts/addons`
  * pathToStart
    * Path to the server start file
    * default `src/py_3_7/serv_int_start.py`
  * source
    * Name of the local-to-role source file for crowdrender
    * default `cr_022_bl280.zip`

Dependencies
------------

* ansible
  * naftulikay.degoss
    * Used for testing in local vagrant instance

Example Playbook
----------------

Note `awsGPU` in this example is not implemented at this time

    - hosts: servers
      roles:
         - { role: asciifaceman.ansible.blender-crowd-renderfarm, awsGPU: true }

License
-------

BSD

Author Information
------------------

Charles Corbett <nafredy at gmail.com>
