
## How to set up for new machines.
First, set up git, git profile, and git ssh keys, basically log in with my profile kinda thing. 

then just clone thi repo via ssh (since/if the repo is private)
```sh
git clone git@github.com:sasta-kro/dotfiles.git
```

after cloning the repo, just run the setup script. 
```
sh ~/dotfiles/scripts/setup_dotfiles.sh
```


### Install script from Github for new machines.
running this will work fine if the repo is public (in the future idk)
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/sasta-kro/dotfiles/main/scripts/bootstrap.sh)"
```

