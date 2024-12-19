# Substrate Node Deployment

This project provides a setup for running and deploying Substrate-based nodes locally or on virtual machines. It includes Docker configuration for ease of use and flexibility.

---

## Features
- Run multiple Substrate nodes locally with `docker-compose`.
- Deploy nodes to remote virtual machines using a simple deployment script.
- Customize node configurations for development or testing.

---

## Prerequisites
### Ensure you have the following installed on your system:
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Rust](https://www.rust-lang.org/tools/install) (if building custom binaries)
- [SCP and SSH](https://www.openssh.com/) (for VM deployment)


## Running Locally

### To run the Substrate nodes locally:

**1. Clone the repository:**
   ```bash
   git clone <repository-url>
   cd  devnet-deploy
   ```
**2. Build and start the nodes:**

```bash
./deploy.sh local
```
**3. Check the running containers:**
```bash
docker ps
```

**4. Access the logs for a specific node:**

```bash
docker logs <container_name>

```
Nodes will be accessible via the following ports:

- Node 1: RPC (9933), WS (9944), P2P (30333)
- Node 2: RPC (9934), WS (9945), P2P (30334)
- Node 3: RPC (9935), WS (9946), P2P (30335)


## Deploying on Virtual Machines

### To deploy a Substrate node to a virtual machine:

**1. Ensure SSH access to the VM is configured.**

**2. Run the deployment script:**

```bash
./deploy.sh vm <VM_IP> <NODE_DIR>
```


Replace:

- <VM_IP> with the IP address of the virtual machine.
- <NODE_DIR> with the path to the node configuration (e.g., vm/node1).

**3. Verify the node is running on the VM:**
```bash
ssh user@<VM_IP> docker ps
```

## Customizing the Node
### To customize your Substrate-based node:

**1. Modify the Dockerfile to include your own binary or configuration files.**

**2. Update the docker-compose.yml or VM-specific configuration to reflect custom changes.**

## Stopping the Nodes

### To stop all running nodes:

## Locally

```bash
docker-compose down
```

## On VM:

```bash
ssh user@<VM_IP> docker stop <container_id> && docker rm <container_id>
```

### Troubleshooting
## Container not starting:

**1. Check logs using docker logs <container_name>.**
- Port conflicts:

**2.Modify ports in docker-compose.yml or VM configuration to avoid conflicts.**
- Deployment script errors:

**Ensure the VM has Docker installed and the user has sufficient permissions.**
