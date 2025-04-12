# Introduction

Welcome to the ansible playground! Setup your own ansible environment using  [kind](https://kind.sigs.k8s.io/)

# Required-tools

* [docker](https://docs.docker.com/get-started/get-docker/)
* [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)
* [kind](https://kind.sigs.k8s.io/)

# Usage:
To create the playground, simply run `./setup -m create`

To delete the playground, simply run `./setup -m delete`

# Useful commands:
To ping hosts `kubectl exec -it client -- ansible myhosts -m ping -i inventory.yaml`

To run the default playbook `kubectl exec -it client -- ansible-playbook -i inventory.yaml playbook.yaml`


# Architecture
```
+-----------------------------------------------------------+
|                                                           |
|                                                           |
|               +--------------------------+                |
|               |                          |                |
|               |       client pod         |                |
|               |     (ansible installed)  |                |
|               +------------+-------------+                |
|                            |                              |
|                +-----------+------------+                 |
|                |           |            |                 |
|                |           |            |                 |
|       +-----------------------------------------------+   |
|       |        |           |            |             |   |
|       |        |           |            |             |   |
|       |        |           |            |             |   |
|       |        |           |            |             |   |
|       |     +--v----+   +--v----+   +---v---+         |   |
|       |     |       |   |       |   |       |         |   |
|       |     | mpod-0|   | mpod-1|   | mpod-n|         |   |
|       |     |       |   |       |   |       |         |   |
|       |     +-------+   +-------+   +-------+         |   |
|       |                               mpod statefulset|   |
|       +-----------------------------------------------+   |
|                                                           |
|                                           kind-cluster    |
+-----------------------------------------------------------+
```
