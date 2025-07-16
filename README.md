# RTG-Vite-Tailwindcss

## What
Ready To Go Vite-Tailwindcss is a bash script to quickly setup a vanilla Vite 7.x.x + Tailwindcss 4.x.4 ready to use.


## How
Simply run the script wherever you want to create your project.

```bash
./vite-tailwindcss-init.sh
```

It will then create your new project root folder:

```bash
my-project
    ├── index.html
    ├── node_modules
    ├── package.json
    ├── package-lock.json
    ├── public
    ├── src
    └── vite.config.js
```

## Output
You'll end up with a vanilla Vite 7 project, configured with Tailwindcss 4, without any Vite default demo content or unecessary files.


> Note: Since Tailwindcss 4, there's no need for a tailwindcss config file, thus you won't find any. The Tailwindcss scanning directives are located in the Vite config file `vite.config.js`, you can edit them there.

> Note: You can add your custom Tailwindcss classes in the `style.css` with the `@theme` directive. See [https://tailwindcss.com/docs/theme].

> Note: There's no need to import the `style.css` file in `index.html` since Vite automatically injects the css via the `main.js` file.

## Documentation

- [Vite](https://vitejs.dev/guide/)
- [Tailwindcss](https://tailwindcss.com/docs/installation)

## TODOs
- [x] User choice to autoremove script
- [x] Parse user input to avoid characters that npm hates
- [ ] Control/lock/make choose both Vite and Tailwindcss versions (for now it's just what's nowadays.. currently Vite 7 and Tailwindcss 4)
- [ ] Make the npm loading visible (user may freak out because it can resemble to script freeze)
- [ ] Remove the link rel="icon" for vite.svg in index.html
