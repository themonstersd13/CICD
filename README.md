# CICD Hands On

### Installation

Firstly you need :
- JRE 17 or 21
- Docker and Docker Compose Plugin
- Jenkins (LTS or Weekly)
- BunJS

Make sure you add `Jenkins` to `Docker` Group, and restart `jenkins.service`.

Install script for above tools ( only for debian based distributions can be found inside Jenkins folder)
```bash
curl -sSL https://raw.githubusercontent.com/AdityaAparadh/CICD/master/Jenkins/install.sh | sudo bash
```


### Setup

1. Visit `http://localhost:8080`

The initial password can be found by:
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

2. Then select **Install Recommended Plugins**. Wait for installation.

3. After that, ignore user setup for now

4. On Jenkins Dashboard, click on `New Item`

5. Name the Item, and select type as **Pipeline**

6. Set respective fields, and for groovy script, copy from this repo. Also set Git SCM polling to "* * * * *", which will poll every minute.

7. Save pipeline.

8. Build Manually.

9. Visiting `http://localhost:5173` should now open the application.

10. `docker ps` should show three running containers, for Frontend, Backend and Database (MongoDB).
