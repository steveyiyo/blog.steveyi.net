---
title: "Migrating from WordPress to Hugo"
date: 2021-02-10T14:27:17+08:00
draft: false
image: "https://i.imgur.com/1a3dW0f.png"
---

After registering my first domain, [steveyigame.com](https://whois.steveyi.net/whois/steveyigame.com), in 2018, I tried to set up my first WordPress blog. At that time, I was also learning to use Linux systems and came to understand the difference between **cloud drives (like Google Drive)** and **file servers**.

## Why Switch to Hugo? Is WordPress Not Good?

I believe there is no such thing as good or bad, it's all personal preference. However, as I gradually learned about backend development, I thought, "If it can be a static website, let it be static and don't let the website server handle things." PS. WordPress can also be optimized very well, but I simply don't want to optimize it XD.

In addition, because WordPress is a dynamic website, it must be connected to a database. When a general user visits the website, the website goes to the database to fetch data, processes it, and then responds to the user.

**I don't want to maintain a database R**

## Performance Comparison

Let's take a look at the specific differences before and after the switch.

- WordPress loading speed

![](https://i.imgur.com/sNBNllD.jpg) 

- Hugo loading speed

![](https://i.imgur.com/SxthIX9.png)

As you can see, WordPress takes 4.11 seconds to load for the first time, while Hugo only takes 1.41 seconds, a significant difference.

## About Hugo

Because Hugo is a static website, I thought of deploying it on GitHub and using it with GitHub Pages.

So I opened two repositories, one for the source files of the website. Of course, if you want to open it in the same repository, you can use different branches!

- Hugo source code

![](https://i.imgur.com/Ip6SEwt.png)

- Generated website source code

![](https://i.imgur.com/ELvsgUd.png)

## Installing Hugo

First, let's install [Hugo](https://gohugo.io/) on your computer.

The Hugo official website provides pre-compiled versions for the following systems, which means that these systems do not need to be compiled manually!

- macOS (Darwin) for x64, i386, and ARM architectures
- Windows
- Linux
- OpenBSD
- FreeBSD

You can download the pre-compiled files directly from the official website: https://github.com/gohugoio/hugo/releases

If you are a macOS user, you can also install [Homebrew](https://brew.sh/) and use the following command to install Hugo:
```
brew install hugo
```

## Configuring Hugo

Next, we use the following command to create a new website:
```
hugo new site path
```
![](https://i.imgur.com/7zg789v.png)

Then we will see these files:

![](https://i.imgur.com/ELrRBZY.png)

Open the config.toml file and you will see these options that we can customize for our website:
* baseURL
* languageCode
* title

![](https://i.imgur.com/x0zfGWq.png)

Then you can use this command to add a new post/page:
```
hugo new post/hello.md
```

After getting familiar with Hugo, let's set up the GitHub part! PS. If you want to learn more about how to use Hugo, you can refer to the [official documentation](https://gohugo.io/getting-started/quick-start/).

## Deploying with GitHub and GitHub Pages

1. Create a repository.
2. In the `.github/workflows` directory of the blog source code, add a GitHub Action configuration file.

Here I used three Actions, each of them is as follows:
- actions/checkout@v2
- peaceiris/actions-hugo@v2
- peaceiris/actions-gh-pages@v3

```yaml
name: Hugo Build and Deploy

on:
  push:
    branches:
      - main

jobs:
  build-deploy:
    runs-on: ubuntu-18.04
    steps:
      - uses: actions/checkout@v2
        with:
          submodules: true

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: '0.64.1'

      - name: Build
        run: hugo --minify

      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          deploy_key: ${{ secrets.ACTIONS_DEPLOY_KEY }}
          external_repository: yourusername/yourrepository
          publish_dir: ./docs
          publish_branch: gh-page # branch name
          cname: blog.steveyi.net # if not using custom domain, it is not necessary
```

3. Commit the configuration file to the GitHub repository.

![](https://i.imgur.com/TV5iCDF.png)

You will definitely encounter an error at this point because we did not provide an ssh-key for GitHub Action to use.

Let's first create an ssh-key. Then, in the settings of the repository, select Deploy keys and add a key, remember to check Allow write access.

![](https://i.imgur.com/QJ0PqtO.png)

Next, in the secrets part, upload the Private Key of the SSH Key.

![](https://i.imgur.com/7GbNJ2m.png)

Finally, commit again and there will be no errors!

![](https://i.imgur.com/fJiQvwT.png)

At the same time, we can also visit the website to see if it can be browsed! PS. If you have a custom domain, be sure to set a CNAME to yourusername.github.io!