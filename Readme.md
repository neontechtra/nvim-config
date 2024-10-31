Thus far:

```bash
git clone {github}/nvim-config.git ~/.config/nvim
```
then 

```bash
nvim 
```
should fire everything up but just some basic tweaks and colours added thus far

### Why ...

lua/ folder is needed based on nvim design, so that using `nvim` anywhere will appropriately load the files

### LSP Info

will need clangd for C
```
sudo apt update && sudo apt install clangd
```

you can use npm for python, bit heavy but it works -- may need to add npm bin -g or npm root -g path to PATH
