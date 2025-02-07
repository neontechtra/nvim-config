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
Updated to use mason, comments should help explain whats going on, any issues can be googled/youtube

#### Key Mappings Explained

1. **Arrow Keys (Up and Down)**:
   - **Function**: Navigate through the autocomplete suggestions.
   - **Usage**: You can use the **Up** and **Down** arrow keys to move through the list of suggestions. This is a default behavior of `nvim-cmp` and is often intuitive for users who prefer arrow key navigation.

2. **`<C-y>` (Ctrl + y)**:
   - **Function**: Confirm the currently selected suggestion.
   - **Usage**: When you select an autocomplete suggestion and press `<C-y>`, it inserts the selection into your code. Additionally, if a function or class requires header files, this key may automatically insert them (assuming the LSP provides this functionality, which is common in C/C++).
   - **When You'll Use It**: When you see a suggestion you want to use, press `<C-y>` to insert it.

3. **`<C-Space>` (Ctrl + Space)**:
   - **Function**: Manually trigger the autocomplete menu.
   - **Usage**: If you want to see suggestions at a particular cursor position, you can press `<C-Space>` to open the autocomplete menu manually. This is useful if the menu doesn’t automatically appear or if you want to trigger it in a specific context.
   - **When You'll Use It**: If the autocomplete menu doesn’t show up but you want suggestions, press `<C-Space>` to force it to appear.

4. **`<C-e>` (Ctrl + e)**:
   - **Function**: Close the autocomplete menu without selecting anything.
   - **Usage**: If you decide not to use any of the suggestions in the autocomplete menu, you can press `<C-e>` to close it without inserting anything.
   - **When You'll Use It**: Use this when the autocomplete menu appears but you want to dismiss it without any changes.

5. **`<C-d>` and `<C-f>` (Ctrl + d and Ctrl + f)**:
   - **Function**: Scroll up and down within the documentation preview window.
   - **Usage**: If a selected autocomplete item has additional documentation (like function parameters or descriptions), a small documentation window will appear. You can use `<C-d>` to scroll down and `<C-f>` to scroll up within that documentation.
   - **When You'll Use It**: This is helpful if you need more details about a function, class, or variable before selecting it. It provides context, which can be especially useful for libraries or APIs you’re not fully familiar with.

#### Summary of Key Functions
- **Arrow Keys**: Navigate suggestions.
- **`<C-y>`**: Confirm selection and insert it.
- **`<C-Space>`**: Manually trigger the autocomplete menu.
- **`<C-e>`**: Close the menu without making a selection.
- **`<C-d>`/`<C-f>`**: Scroll within the documentation window.

#### When You’ll Use These Mappings
- **General Coding**: You’ll primarily use the arrow keys, `<C-y>`, and `<C-e>` for day-to-day coding, as they cover selecting, confirming, and dismissing suggestions.
- **Looking for Documentation**: `<C-d>` and `<C-f>` come in handy when dealing with functions or APIs that have detailed documentation, such as in languages like Python and C.
- **Manually Triggering Suggestions**: `<C-Space>` is useful when you want control over when the autocomplete appears, such as after typing part of a variable name or function.

