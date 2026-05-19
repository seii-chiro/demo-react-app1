# Task: Dockerize the React App for Production

This React + TypeScript + Vite app is missing its Docker setup.

Create the following files in this folder:

- `Dockerfile`
- `docker-compose.yml`
- `.dockerignore`
- `nginx.conf`

## Requirements

### `Dockerfile`

Create a Dockerfile that:

- Builds the Vite app with an official Node image.
- Uses Nginx as the production web server.
- Does not run `npm run dev` or `npm run preview` in the final container.
- Sets the Node build working directory to `/app`.
- Copies `package.json` and `package-lock.json`.
- Runs `npm ci` to install dependencies.
- Copies the rest of the project files.
- Builds the production files with `npm run build`.
- Copies the generated `dist` folder into Nginx's static web root.
- Copies `nginx.conf` into Nginx's default site config path.
- Exposes port `80`.
- Starts Nginx in the foreground.

### `docker-compose.yml`

Create a Compose file that:

- Defines one service named `frontend`.
- Builds the image from the current directory.
- Maps a host port, such as `8080` or any other available port, to port `80` in the container.
- Uses a readable image name, such as `demo-react-app1-frontend`.

### `nginx.conf`

Create an Nginx config that:

- Listens on port `80`.
- Serves files from `/usr/share/nginx/html`.
- Uses `index.html` as the default file.
- Falls back to `index.html` for client-side React routes.

### `.dockerignore`

Create a Docker ignore file that excludes files and folders that should not be copied into the image, including:

- `node_modules`
- `dist`
- `.git`
- `.DS_Store`
- `npm-debug.log*`

## Check Your Work

From this folder, run:

```sh
docker compose up --build
```

Then open:

```txt
http://localhost:8080
```

The standalone production frontend should load from Nginx inside the Docker container.

Stop the container with:

```sh
docker compose down
```
