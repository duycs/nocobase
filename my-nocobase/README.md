## INIT STEPS

### 1. Install docker: https://docs.docker.com/engine/install/
### 2. Install Postgres database: 
  At backup folder: ```docker compose up -d```
### 3. Restore database: restore backup file prod-dump-nocobase-...tar
### 4. Build dev:
  ```yarn install --frozen-lockfile```
  ```yarn nocobase install --lang=en-US```
  ```yarn dev```
### 5. Test
Open http://localhost:13000 in a web browser. The initial account and password are admin@nocobase.com and admin123
